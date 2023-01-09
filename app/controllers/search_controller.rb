class SearchController < ApplicationController 
  def index 
    @stations = StationFacade.search_station(params[:location])
    @gps = GpsFacade.directions(params[:location])
  end
end