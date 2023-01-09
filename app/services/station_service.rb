class StationService 
  def self.closest_station(location)
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?&location=#{location}&limit=1")

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new("https://developer.nrel.gov") do |f|
      f.params['api_key'] = ENV['fuel_api_key']
    end
  end
end