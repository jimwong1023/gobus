module Calculation
  def to_rad(number)
    number * Math::PI / 180
  end

  def distance(loc1, loc2)
    lat1, long1 = loc1[0].to_f, loc1[1].to_f
    lat2, long2 = loc2[0].to_f, loc2[1].to_f

    delta_Lat = to_rad(lat2-lat1)
    delta_Long = to_rad(long2-long1)
    
    const_a = Math.sin(delta_Lat/2) * Math.sin(delta_Lat/2) + Math.cos(to_rad(lat1)) * Math.cos(to_rad(lat2)) * Math.sin(delta_Long/2) * Math.sin(delta_Long/2)
    const_b = 2 * Math.atan2(Math.sqrt(const_a), Math.sqrt(1-const_a))
    result = const_b * 3959 #Earth radius constant in miles
  end
end