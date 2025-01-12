Gem::Specification.new do |spec|
  spec.name		= "rhet-butler"
  spec.version		= "0.14.1"
  author_list = {
    "Judson Lester" => 'nyarly@gmail.com'
  }
  spec.authors		= author_list.keys
  spec.email		= spec.authors.map {|name| author_list[name]}
  spec.summary		= "A web tech presentation system"
  spec.description	= <<-EndDescription
  Rhet Butler is a presentation assistant. Build a slide deck in simple YAML,
  design it in CSS, run the presentation with your smartphone over Websockets.
  EndDescription

  spec.rubyforge_project= spec.name.downcase
  spec.homepage        = "http://nyarly.github.com/#{spec.name.downcase}"
  spec.required_rubygems_version = Gem::Requirement.new(">= 0") if spec.respond_to? :required_rubygems_version=

  # Do this: y$@"
  # !!find lib bin doc spec spec_help -not -regex '.*\.sw.' -type f 2>/dev/null
  spec.files		= %w[
    lib/rhet-butler/slide-group.rb
    lib/rhet-butler/file-loading.rb
    lib/rhet-butler/configuration.rb
    lib/rhet-butler/command-line.rb
    lib/rhet-butler/slide-rendering.rb
    lib/rhet-butler/file-manager.rb
    lib/rhet-butler/slide-includer.rb
    lib/rhet-butler/filter-resolver.rb
    lib/rhet-butler/stasis/identity-transform.rb
    lib/rhet-butler/stasis/writer.rb
    lib/rhet-butler/stasis/resource-mapping.rb
    lib/rhet-butler/stasis/html-transform.rb
    lib/rhet-butler/stasis/css-transform.rb
    lib/rhet-butler/stasis/document-transform.rb
    lib/rhet-butler/stasis/rack-loader.rb
    lib/rhet-butler/stasis/http-loader.rb
    lib/rhet-butler/stasis/transform-queue.rb
    lib/rhet-butler/stasis.rb
    lib/rhet-butler/slide-renderer.rb
    lib/rhet-butler/yaml-type.rb
    lib/rhet-butler/html-generator.rb
    lib/rhet-butler/slide-contents/embed.rb
    lib/rhet-butler/slide-contents.rb
    lib/rhet-butler/yaml-schema.rb
    lib/rhet-butler/static-generator.rb
    lib/rhet-butler/web/presentation-app.rb
    lib/rhet-butler/web/assets-app.rb
    lib/rhet-butler/web/main-app.rb
    lib/rhet-butler/web/qr-display-app.rb
    lib/rhet-butler/include-processor.rb
    lib/rhet-butler/slide.rb
    lib/rhet-butler/slide-traverser.rb
    lib/rhet-butler/sass-functions.rb
    lib/rhet-butler/slide-renderers/markdown.rb
    lib/rhet-butler/slide-renderers/textile.rb
    lib/rhet-butler/slide-renderers/code.rb
    lib/rhet-butler/slide-renderers/cues.rb
    lib/rhet-butler/messaging.rb
    lib/rhet-butler/resource-localizer.rb
    lib/rhet-butler/slide-loader.rb
    bin/rhet-butler
    spec/configuration.rb
    spec/command-line.rb
    spec/slide-rendering.rb
    spec/rhet-butler.rb
    spec/html-generation.rb
    spec/javascripts/support/run.html.erb
    spec/javascripts/support/jasmine_helper.rb
    spec/javascripts/support/jasmine.yml
    spec/javascripts/helpers/jj-fixture-path.js
    spec/javascripts/helpers/.gitkeep
    spec/javascripts/helpers/jasmine-jquery.js
    spec/javascripts/helpers/jquery-3.4.0.min.js
    spec/javascripts/present_spec.js
    spec/javascripts/fixtures/long-transition-group-1.html
    spec/javascripts/fixtures/test-presentation.html
    spec/javascripts/fixtures/quiet_console.js
    spec/javascripts/fixtures/long-animation-group-1.html
    spec/javascripts/fixtures/looped-animation-group-1.html
    spec/javascripts/utils_spec.js
    spec/presentation-view.rb
    spec/static-generator.rb
    spec/main-app.rb
    spec/sass-functions.rb
    spec/messaging.rb
    spec/resource-localizer.rb
    spec/slide-loader.rb
  ] +
  # !!find default-configuration -not -regex '.*\.sw.' -type f 2>/dev/null
  %w[
    default-configuration/assets/fonts.gstatic.com/s/droidsansmono/v10/6NUO8FuJNQ2MbkrZ5-J8lKFrp7pRef2u.ttf
    default-configuration/assets/fonts.gstatic.com/s/slackey/v9/N0bV2SdQO-5yM0-dGlNQIQ.ttf
    default-configuration/assets/fonts.gstatic.com/s/arimo/v12/P5sBzZCDf9_T_1Wi4TRNrZc.ttf
    default-configuration/assets/fonts.gstatic.com/s/cinzeldecorative/v7/daaHSScvJGqLYhG8nNt8KPPswUAPniZoadlESTQ.ttf
    default-configuration/assets/fonts.gstatic.com/s/cinzeldecorative/v7/daaHSScvJGqLYhG8nNt8KPPswUAPniZQa9lESTQ.ttf
    default-configuration/assets/apple-touch-icon-precomposed.png
    default-configuration/assets/fonts/opensans/v6/PRmiXeptR36kaC0GEAetxi8cqLH4MEiSE0ROcU-qHOA.ttf
    default-configuration/assets/fonts/opensans/v6/cJZKeOuBrn4kERxqtaUH3aCWcynf_cDxXwCLxiixG1c.ttf
    default-configuration/assets/fonts/opensans/v6/xjAJXh38I15wypJXxuGMBp0EAVxt0G0biEntp43Qt6E.ttf
    default-configuration/assets/fonts/opensans/v6/MTP_ySUJH_bn48VBG8sNSonF5uFdDttMLvmWuJdhhgs.ttf
    default-configuration/assets/fonts/ptsans/v5/FUDHvzEKSJww3kCxuiAo2A.ttf
    default-configuration/assets/fonts/ptsans/v5/PIPMHY90P7jtyjpXuZ2cLKCWcynf_cDxXwCLxiixG1c.ttf
    default-configuration/assets/fonts/ptsans/v5/0XxGQsSc1g4rdRdjJKZrNC3USBnSvpkopQaUR-2r7iU.ttf
    default-configuration/assets/fonts/ptsans/v5/lILlYDvubYemzYzN7GbLkInF5uFdDttMLvmWuJdhhgs.ttf
    default-configuration/assets/fonts/ptserif/v5/EgBlzoNBIHxNPCMwXaAhYPesZW2xOQ-xsNqO47m55DA.ttf
    default-configuration/assets/fonts/ptserif/v5/QABk9IxT-LFTJ_dQzv7xpJ0EAVxt0G0biEntp43Qt6E.ttf
    default-configuration/assets/fonts/ptserif/v5/Foydq9xJp--nfYIx2TBz9fEr6Hm6RMS0v1dtXsGir4g.ttf
    default-configuration/assets/fonts/ptserif/v5/03aPdn7fFF3H6ngCgAlQzC3USBnSvpkopQaUR-2r7iU.ttf
    default-configuration/assets/rhet-butler.jpg
    default-configuration/assets/favicon.ico
    default-configuration/assets/fonts.googleapis.com/css/family=Arimo:700|Droid\ Sans\ Mono|Cinzel\ Decorative:700,900|Slackey,subset=latin,latin-ext
    default-configuration/assets/stylesheets/rhet.css.sass
    default-configuration/assets/stylesheets/highlight/tomorrow-night-blue.css
    default-configuration/assets/stylesheets/highlight/tomorrow-night.css
    default-configuration/assets/stylesheets/highlight/sunburst.css
    default-configuration/assets/stylesheets/highlight/googlecode.css
    default-configuration/assets/stylesheets/highlight/dark.css
    default-configuration/assets/stylesheets/highlight/pojoaque.css
    default-configuration/assets/stylesheets/highlight/arta.css
    default-configuration/assets/stylesheets/highlight/solarized_light.css
    default-configuration/assets/stylesheets/highlight/tomorrow-night-bright.css
    default-configuration/assets/stylesheets/highlight/idea.css
    default-configuration/assets/stylesheets/highlight/ascetic.css
    default-configuration/assets/stylesheets/highlight/default.css
    default-configuration/assets/stylesheets/highlight/rainbow.css
    default-configuration/assets/stylesheets/highlight/solarized_dark.css
    default-configuration/assets/stylesheets/highlight/xcode.css
    default-configuration/assets/stylesheets/highlight/github.css
    default-configuration/assets/stylesheets/highlight/school_book.css
    default-configuration/assets/stylesheets/highlight/vs.css
    default-configuration/assets/stylesheets/highlight/far.css
    default-configuration/assets/stylesheets/highlight/pojoaque.jpg
    default-configuration/assets/stylesheets/highlight/brown_paper.css
    default-configuration/assets/stylesheets/highlight/tomorrow.css
    default-configuration/assets/stylesheets/highlight/tomorrow-night-eighties.css
    default-configuration/assets/stylesheets/highlight/brown_papersq.png
    default-configuration/assets/stylesheets/highlight/ir_black.css
    default-configuration/assets/stylesheets/highlight/zenburn.css
    default-configuration/assets/stylesheets/highlight/magula.css
    default-configuration/assets/stylesheets/highlight/monokai.css
    default-configuration/assets/stylesheets/highlight/school_book.png
    default-configuration/assets/stylesheets/google-open-sans.css
    default-configuration/assets/stylesheets/presenter/rhet.css.sass
    default-configuration/assets/stylesheets/_animate-helpers.scss
    default-configuration/assets/stylesheets/setup.css
    default-configuration/assets/stylesheets/solarized.scss
    default-configuration/assets/stylesheets/presentation.css
    default-configuration/assets/stylesheets/font.sass
    default-configuration/assets/stylesheets/prez-local.css
    default-configuration/assets/stylesheets/solarized.sass
    default-configuration/assets/stylesheets/animate/_attention.scss
    default-configuration/assets/stylesheets/animate/attention/_wobble.scss
    default-configuration/assets/stylesheets/animate/attention/_shake.scss
    default-configuration/assets/stylesheets/animate/attention/_swing.scss
    default-configuration/assets/stylesheets/animate/attention/_tada.scss
    default-configuration/assets/stylesheets/animate/attention/_wiggle.scss
    default-configuration/assets/stylesheets/animate/attention/_pulse.scss
    default-configuration/assets/stylesheets/animate/attention/_flash.scss
    default-configuration/assets/stylesheets/animate/_flip.scss
    default-configuration/assets/stylesheets/animate/roll/_rollIn.scss
    default-configuration/assets/stylesheets/animate/roll/_rollOut.scss
    default-configuration/assets/stylesheets/animate/lightSpeed/_lightSpeedOut.scss
    default-configuration/assets/stylesheets/animate/lightSpeed/_lightSpeedIn.scss
    default-configuration/assets/stylesheets/animate/flip/_flipIn.scss
    default-configuration/assets/stylesheets/animate/flip/_flipOut.scss
    default-configuration/assets/stylesheets/animate/_roll.scss
    default-configuration/assets/stylesheets/animate/_fade.scss
    default-configuration/assets/stylesheets/animate/_windblown.sass
    default-configuration/assets/stylesheets/animate/bounce/_bounceIn.scss
    default-configuration/assets/stylesheets/animate/bounce/_bounceOut.scss
    default-configuration/assets/stylesheets/animate/_lightSpeed.scss
    default-configuration/assets/stylesheets/animate/rotate/_rotateOut.scss
    default-configuration/assets/stylesheets/animate/rotate/_rotateIn.scss
    default-configuration/assets/stylesheets/animate/_rotate.scss
    default-configuration/assets/stylesheets/animate/special/_hinge.scss
    default-configuration/assets/stylesheets/animate/_bounce.scss
    default-configuration/assets/stylesheets/animate/windblown/_windblownIn.sass
    default-configuration/assets/stylesheets/animate/windblown/_windblownOut.sass
    default-configuration/assets/stylesheets/animate/fade/_fadeOut.sass
    default-configuration/assets/stylesheets/animate/fade/_fadeIn.sass
    default-configuration/assets/stylesheets/animate/_special.scss
    default-configuration/assets/apple-touch-icon.png
    default-configuration/assets/javascript/sockjs-0.3.4.js
    default-configuration/assets/javascript/utils.js
    default-configuration/assets/javascript/highlight.pack.js
    default-configuration/assets/javascript/rhet-butler/transition-stations.js
    default-configuration/assets/javascript/rhet-butler/tree-builder.js
    default-configuration/assets/javascript/rhet-butler/transition-states.js
    default-configuration/assets/javascript/rhet-butler/step.js
    default-configuration/assets/javascript/rhet-butler/child-step.js
    default-configuration/assets/javascript/rhet-butler/steps/item.js
    default-configuration/assets/javascript/rhet-butler/steps/root.js
    default-configuration/assets/javascript/rhet-butler/steps/group.js
    default-configuration/assets/javascript/rhet-butler/steps/slide.js
    default-configuration/assets/javascript/rhet-butler/transition-station.js
    default-configuration/assets/javascript/keyboard-nav.js
    default-configuration/assets/javascript/sockjs-0.3.js
    default-configuration/assets/javascript/sockjs-0.2.1.js
    default-configuration/assets/javascript/presenter.js
    default-configuration/assets/javascript/highlight.js/README.md
    default-configuration/assets/javascript/highlight.js/LICENSE
    default-configuration/assets/javascript/highlight.js/README.ru.md
    default-configuration/assets/javascript/highlight.js/classref.txt
    default-configuration/presenter/templates/live-javascript.html.erb
    default-configuration/presenter/templates/stylesheets.html.erb
    default-configuration/presenter/templates/slide.html.erb
    default-configuration/presenter/templates/slide-notes.html.erb
    default-configuration/presenter/config.yaml
    default-configuration/viewer/templates/live-javascript.html.erb
    default-configuration/viewer/templates/slide-notes.html.erb
    default-configuration/viewer/config.yaml
    default-configuration/skels/config.yaml
    default-configuration/common/templates/group.html.erb
    default-configuration/common/templates/stylesheets.html.erb
    default-configuration/common/templates/slide.html.erb
    default-configuration/common/templates/presentation.html.erb
    default-configuration/common/templates/header-javascript.html
    default-configuration/common/templates/presenter-qr.html.erb
    default-configuration/common/config.yaml
  ]

  spec.test_file        = "spec_support/gem_test_suite.rb"
  spec.licenses = ["MIT"]
  spec.require_paths = %w[lib/]
  spec.rubygems_version = "1.3.5"

  spec.extra_rdoc_files = Dir.glob("doc/**/*")
  spec.rdoc_options	= %w{--inline-source }
  spec.rdoc_options	+= %w{--main doc/README }
  spec.rdoc_options	+= ["--title", "#{spec.name}-#{spec.version} Documentation"]

  spec.executables = %w{rhet-butler}

  spec.add_dependency("compass-core", "~> 1.0.0")
  spec.add_dependency("compass-import-once", "~> 1.0.1")
  spec.add_dependency("thor", "> 0")
  spec.add_dependency("rack", "> 0")
  spec.add_dependency("thin", "> 0")
  spec.add_dependency("sockjs", "~> 0.3.4")
  spec.add_dependency("valise", "~> 1.0")
  spec.add_dependency("tilt", "< 2.0")

  spec.add_dependency("nokogiri")
  spec.add_dependency("crass")
  spec.add_dependency("addressable")
  spec.add_dependency("system-getifaddrs", "~> 0.2.0")
  spec.add_dependency("rqrcode", "~> 0.4.2")

  spec.add_dependency("RedCloth", "~> 4.3.0")
  spec.add_dependency("kramdown", "~> 1.7.0")

  #spec.post_install_message = "Thanks for installing my gem!"
end
