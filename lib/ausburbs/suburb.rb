module Ausburbs
  class Suburb
    attr_accessor :name, :postcode, :state, :latitude, :longitude
    def initialize(data = nil)
      parse!(data) if data
    end

    private
    def parse!(data)
      self.name = data[:name].to_s
      self.postcode = data[:postcode].to_s.rjust(4, '0')
      self.state = data[:state].to_s
      self.latitude = data[:latitude].to_f
      self.longitude = data[:longitude].to_f
    end
  end
end
