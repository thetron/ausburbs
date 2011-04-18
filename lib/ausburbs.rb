module Ausburbs
  autoload :State, 'ausburbs/state'
  autoload :Suburb, 'ausburbs/suburb'

  @data_path = File.join(File.dirname(__FILE__), '..', 'data')

  class << self
    def state_names
      @@states.keys.sort
    end

    def state(state_name)
      load_data
      @@states[state_name.to_s.upcase]
    end

    def states
      load_data
      @@states.values.sort{ |s1, s2| s1.name <=> s2.name }
    end

    def suburbs(state_name)
      load_data
      Ausburbs.states[state.to_s.upcase].suburbs
    end

    private
    def load_data
      @@states ||= {}
      if @@states.empty?
        data = YAML.load_file( File.join(@data_path, 'suburbs.yml') )
        data.each do |state_name, suburbs|
          @@states[state_name] = State.new(state_name, suburbs)
        end
      end
    end
  end
end
