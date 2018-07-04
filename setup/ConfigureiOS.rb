module Pod

  class ConfigureIOS
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      configurator.add_pod_to_podfile "SKYKit', '~> 1.6"

      prefix = nil

      loop do
        prefix = configurator.ask("What is your class prefix")

        if prefix.include?(' ')
          puts 'Your class prefix cannot contain spaces.'.red
        else
          break
        end
      end

      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/ios/PROJECT.xcodeproj",
        :platform => :ios,
        :prefix => prefix
      }).run

      `mv ./templates/ios/* ./`

      # There has to be a single file in the Classes dir
      # or a framework won't be created, which is now default
      `touch Pod/Classes/ReplaceMe.m`
    end
  end

end
