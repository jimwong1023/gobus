class LocationsController < ApplicationController
  def index
    lat, long = params[:lat], params[:long]

    render json: [lat, long]
  end
end