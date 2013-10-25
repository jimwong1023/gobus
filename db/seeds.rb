require 'httparty'
require 'pry'
require 'uri'

def make_route(direction, bus)
  inbound = direction['name'] == 'Inbound' ? true : false
  direction_tag = direction['tag']
  direction_title = direction['title']

  route = Route.new(direction_tag: direction_tag, direction_title: direction_title, inbound: inbound)
  if route.save
    bus.routes << route
    direction['stop'].each do |stop|
      route.stops << Stop.find_by_stop_id(stop['tag'])
    end
  else
    puts "*" * 100
    puts "ROUTE DID NOT SAVE #{direction_tag}"
  end
end

agency = "sf-muni"
response = HTTParty.get("http://webservices.nextbus.com/service/publicXMLFeed?command=routeList&a=#{agency}")
  
response['body']['route'].each do |bus_data|
  bus_line = bus_data['tag']
  bus_title = bus_data['title']
  bus = Bus.new(bus_line: bus_line, bus_title: bus_title)
  if bus.save == false
    puts "*" * 100
    puts "#{bus_line} or #{bus_title} did not save"
  end
end

Bus.all.each do |bus|
  url_bus_tag = URI.escape(bus.bus_line)
  response = HTTParty.get("http://webservices.nextbus.com/service/publicXMLFeed?command=routeConfig&a=#{agency}&r=#{url_bus_tag}")
  response['body']['route']['stop'].each do |stop_data|
    stop_id = stop_data['tag']
    stop_title = stop_data['title']
    lat = stop_data['lat']
    long = stop_data['lon']
    
    stop = Stop.new(stop_id: stop_id, stop_title: stop_title, lat: lat, long: long)
    if stop.save
      bus.stops << stop
    else
      stop = Stop.find_by_stop_id(stop_id)
      if stop != nil
        bus.stops << stop
      end
    end
  end

  if response['body']['route']['direction'].class == Array 
    response['body']['route']['direction'].each do |direction|
      make_route(direction, bus)
    end
  else
    direction = response['body']['route']['direction']
    make_route(direction, bus)
  end
end
