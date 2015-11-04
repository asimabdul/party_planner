require_relative "find_customers.rb"
require_relative "extract_data.rb"
require_relative "distance_calculator.rb"

class PartyPlanner
  def initialize(data_file, radius, home_latitude, home_longitude)
    @data_file = data_file
    @home_latitude = home_latitude.to_f
    @home_longitude = home_longitude.to_f
    @radius = radius.to_i
  end

  #load the data file, gets the customers and prints to STDOUT
  def guest_list
    extract_data = ExtractData.new(@data_file)
    locations = extract_data.load_file
    customers = FindCustomers.new(locations, @radius, @home_latitude, @home_longitude).search
    if customers.empty?
      puts "\n No guests found."
    else
      puts "\nGuest list\n"
      puts "==========\n"
      customers.each {|customer|p "#{customer["user_id"]} -- #{customer["name"]}"}
    end
    nil
  rescue => e
    puts "There was an error retrieving the guest list. \n"
    puts "ERROR: #{e.message}"
    puts "\n #{e.backtrace}"
  end
end
