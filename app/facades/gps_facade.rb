class GpsFacade 
  def self.directions(location)
    json = GpsService.direction_to(location)
    json[:route][:legs].map do |r|
      Gps.new(r)
    end
  end
end