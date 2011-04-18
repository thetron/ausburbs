module Ausburbs
  class Suburb
    attr_accessor :name, :postcode, :state, :latitude, :longitude
    def initialize(data = nil)
      parse!(data) if data
    end

    private
    def parse!(data)
      self.name = data[:name]
      self.postcode = data[:postcode].rjust(4, '0')
      self.state = data[:state]
      self.latitude = data[:latitude]
      self.longitude = data[:longitude]
    end
  end
end
