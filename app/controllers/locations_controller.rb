class LocationsController < ApplicationController
  def index
    lat, long = params[:lat], params[:long]

    routes = {}
    output = []
    Stop.all.each do |stop|
      stop_distance = distance([lat, long], [stop.lat, stop.long])
      
      if stop_distance < 1
        stop.routes.each do |route|
          key = "#{route.bus.bus_title}, #{route.inbound ? 'Inbound' : 'Outbound'}"

          if !routes.has_key?(key)
            routes[key] = stop
          else            
            old_stop = routes[key]
            old_distance = distance([lat, long], [old_stop.lat, old_stop.long])
            if stop_distance < old_distance
              routes[key] = stop
            end
          end

        end
      end
    end

    render json: routes
  end
end




