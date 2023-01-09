class Gps 
  attr_reader :distance, 
              :time, 
              :directions

  def initialize(data) 
    @distance = data[:distance]
    @time = data[:time]
    @directions = data[:maneuvers].pluck(:narrative)
  end
end