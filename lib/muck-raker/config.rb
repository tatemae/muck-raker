module MuckRaker
  
  def self.configuration
    # In case the user doesn't setup a configure block we can always return default settings:
    @configuration ||= Configuration.new
  end
  
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    
    attr_accessor :rails_env
    
    def initialize
      self.rails_env = 'development' # Let's you override the default Rails environment to load a different version of solr
    end
    
  end
end