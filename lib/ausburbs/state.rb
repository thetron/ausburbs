module Ausburbs
  class State
    attr_accessor :name, :suburbs

    def initialize(*args)
      self.name = args[0]
      load_suburb_data!(args[1])
    end

    private
    def load_suburb_data!(data)
      self.suburbs = []
      data.each do |suburb_data|
        self.suburbs << Suburb.new(suburb_data)
      end
      self.suburbs.sort{ |s1, s2| s1.postcode <=> s2.postcode }
    end
  end
end
