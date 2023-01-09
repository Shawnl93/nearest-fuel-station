class StationFacade 
  def self.search_station(location) 
    data = StationService.closest_station(location)
    data[:fuel_stations].map do |s|
      Station.new(s)
    end
  end
end