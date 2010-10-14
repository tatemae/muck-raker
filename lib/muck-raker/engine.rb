require 'muck-raker'
require 'rails'

module MuckRaker
  class Engine < ::Rails::Engine
    
    def muck_name
      'muck-raker'
    end
        
  end
end
