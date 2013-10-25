class LocationsController < ApplicationController
  def index
    lat, long = params[:lat], params[:long]

    result = []
    Stop.all.each do |stop|
      if distance([lat, long], [stop.lat, stop.long]) < 1
        result << stop
      end
    end

    render json: result
  end
end