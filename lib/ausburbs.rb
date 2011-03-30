module Ausburbs
  autoload :State, 'ausburbs/state'
  autoload :Suburb, 'ausburbs/suburb'

  class << self
    def states
      load_data
      @@states
    end

    def suburbs(state)
      Ausburbs.states[state.downcase.to_sym]
    end

    # Condtions:
    # :name -  suburb name
    # :postcode - postcode
    def find(conditions = {})
      
    end

    private
    def load_data
      @@states = {} #load from YAML file, store in memory.
    end
  end
end
