require_relative "distance_calculator"

class FindCustomers
  def initialize(locations, within_radius, home_latitude, home_longitude)
    @locations = locations
    @within_radius = within_radius
    @home_latitude = home_latitude
    @home_longitude = home_longitude
  end

  #retrieves customers within the given radius, sorted by ID
  def search
    customers = []
    @locations.each do |user_location|
      distance = DistanceCalculator.new(@home_latitude, @home_longitude, user_location["latitude"], user_location["longitude"]).distance_between_2_points
      customers << user_location if distance <= @within_radius
    end
    customers.sort! {|x,y| x["user_id"] <=> y["user_id"] }
  end

end