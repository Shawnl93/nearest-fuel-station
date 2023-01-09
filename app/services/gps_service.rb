class GpsService 
  def self.direction_to(location)
    response = conn.get("directions/v2/route?from=5224+W+25th+Ave+Denver+CO+80214&to=1985+Sheridan+Blvd.+Edgewater+CO+80214&key=SPtDEJYPfrO1jM1AhEUS98vZY05FL8Rc")

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new("http://www.mapquestapi.com/") do |f|
      f.params['api_key'] = ENV['fuel_api_key']
    end
  end
end