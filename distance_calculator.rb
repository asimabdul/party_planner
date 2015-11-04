class DistanceCalculator
  RADIUS_OF_EARTH = 6371 #in kilometers

  attr_accessor :lat1, :long1, :lat2, :long2

  def initialize(lat1, long1, lat2, long2)
    @lat1 = lat1.to_f
    @long1 = long1.to_f
    @lat2 = lat2.to_f
    @long2 = long2.to_f
  end
  
  def to_radians(degree)
    degree * (Math::PI/180)
  end

  def distance_between_2_points
    #USING LAW OF COSINES as provided in spec; use vincenty or haversine when greater precision is required

    @lat1 = to_radians(@lat1)
    @long1 = to_radians(@long1)
    @lat2 = to_radians(@lat2)
    @long2 = to_radians(@long2)

    lat_difference = (@lat1 - @lat2).abs
    long_difference = (@long1 - @long2).abs

    central_angle = Math.acos( Math.sin(@lat1) * Math.sin(@lat2) + (Math.cos(@lat1) * Math.cos(@lat2) * Math.cos(long_difference)) )
    central_angle * RADIUS_OF_EARTH
  end

end