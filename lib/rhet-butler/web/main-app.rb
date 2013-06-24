require 'rack/builder'
require 'rack/handler'
require 'thin'
require 'rhet-butler/web/presentation-app'
require 'rhet-butler/web/assets-app'
require 'rhet-butler/web/qr-display-app'
require 'rhet-butler/file-manager'
require 'rhet-butler/messaging'


module RhetButler
  module Web
    class SelectiveAuth < Rack::Auth::Basic
      def call(env)
        #XXX This is to work around a Chrome bug:
        #https://code.google.com/p/chromium/issues/detail?id=123862 #ok
        #When fixed upstream, this'll come out and we'll stop supporting old
        #versions of Chrome.
        #As is, under SSL this is kinda secure (i.e. not at all) because the
        #WS details are secret
        if /^http/ =~ env["rack.url_scheme"] and env["HTTP_UPGRADE"] != "websocket"
          super
        else
          @app.call(env)
        end
      end
    end

    class MainApp
      def initialize(file_manager)
        @file_manager = file_manager
      end

      # Notes re filesets config and slides:
      # All PresentationApps need the same slides but different configs
      # (including templates, etc.)
      #
      # So: there need to be TWO valises:
      #
      # 1) The slides valise - including slidesets that might get included -
      # this one is common between all Apps
      #
      # 2) The config valise - there should be a "common" base to this, and a
      # role specific variation.  Built special, because the /viewer app should
      # allow for config in the root of the project etc, while the /presenter
      # version should require special config (since I'm assuming a boring
      # presentation view)
      #
      def slides
        @file_manager.slide_files
      end

      #Simply renders the bodies of the viewer and presenter apps to make sure
      #there aren't any exceptions
      def check
        viewer_app = PresentationApp.new(:viewer, @file_manager)
        presenter_app = PresentationApp.new(:presenter, @file_manager)
        viewer_app.body
        presenter_app.body
        #XXX static generator "populate assets" - make sure all the assets
        #render as well
      end

      def build_authentication_block(creds_config)
        return (proc do |user, pass|
          creds_config.username == user &&
            creds_config.password == pass
        end)
      end

      def app
        sockjs_options = {
          :sockjs_url => "/assets/javascript/sockjs-0.2.1.js",
          :queue => SlideMessageQueue.new
        }

        viewer_app = PresentationApp.new(:viewer, @file_manager)
        presenter_app = PresentationApp.new(:presenter, @file_manager)
        assets_app = AssetsApp.new(@file_manager)
        qr_app = QrDisplayApp.new(@file_manager, "/presenter")
        presenter_config = presenter_app.configuration
        auth_validation = build_authentication_block(presenter_config)

        Rack::Builder.new do
          #SockJS.debug!

          map "/live/follower" do
            run Rack::SockJS.new(FollowerSession, sockjs_options)
          end

          map "/live/leader" do
            use SelectiveAuth, "Rhet Butler Presenter", &auth_validation
            run Rack::SockJS.new(LeaderSession, sockjs_options)
          end

          use Rack::ShowExceptions

          map "/assets" do
            run assets_app
          end

          map "/qr" do
            run qr_app
          end

          map "/presenter" do
            use SelectiveAuth, "Rhet Butler Presenter", &auth_validation
            run presenter_app
          end

          run lambda{|env|
            if env["PATH_INFO"] == "/"
              viewer_app.call(env)
            else
              assets_app.call(env)
            end
          }
        end
      end

      def start
        configuration = @file_manager.base_config

        puts "Starting server. Try one of these:"
        require 'system/getifaddrs'
        System.get_all_ifaddrs.each do |interface|
          puts "  http://#{interface[:inet_addr].to_s}:#{configuration.serve_port}/"
          puts "  http://#{interface[:inet_addr].to_s}:#{configuration.serve_port}/qr"
        end
        EM.run do
          thin = Rack::Handler.get("thin")
          thin.run(app.to_app, :Host => "0.0.0.0", :Port => configuration.serve_port) do |server|
            server.threaded = true
          end
        end
      end
    end
  end
end
