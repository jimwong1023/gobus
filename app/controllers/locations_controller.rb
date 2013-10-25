class LocationsController < ApplicationController
  def index
    lat, long = params[:lat], params[:long]

    result = []
    Stop.all.each do |stop|
      if distance([lat, long], [stop.lat, stop.long]) < 1
        result << stop
      end
    end

    bus_lines = []
    result.each do |stop|
      bus_lines << stop.buses
    end
    bus_lines.flatten.uniq

    # TIMING - next bus ETA: check if there is another bus coming
    
    # DISTANCE - closest stop: check for the closest stop


    render json: result
  end
end




