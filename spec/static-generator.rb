require 'rhet-butler/static-generator'
require 'rhet-butler/configuration'

describe RhetButler::StaticGenerator do
  let :test_target do
    "spec_support/tmp/test_target"
  end

  before :all do
    test_target = "spec_support/tmp/test_target"

    files = RhetButler::FileManager.new(
      "sources" => ["spec_support/fixtures/project"],
      "static_target" => test_target)

    generator = RhetButler::StaticGenerator.new(files)

    puts "\n#{__FILE__}:#{__LINE__} => #{generator.configuration.inspect}"

    FileUtils::rm_rf test_target
    FileUtils::mkdir_p test_target

    generator.go!
  end

  it "should make some files" do
    Dir.entries(test_target).should include("presentation.html")
  end

  it "should copy in static javascript"
  it "should copy in static stylesheets"
  it "should render sass files"
end
