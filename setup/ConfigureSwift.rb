module Pod

  class ConfigureSwift
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      configurator.add_pod_to_podfile "SKYKit', '~> 0.13.0"

      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/PROJECT.xcodeproj",
        :platform => :ios,
        :prefix => ""
      }).run

      `mv ./templates/swift/* ./`
      
      # There has to be a single file in the Classes dir
      # or a framework won't be created
      `touch Pod/Classes/ReplaceMe.swift`
    end
  end

end
