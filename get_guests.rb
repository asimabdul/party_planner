require_relative "party_planner.rb"


#sets the parameters required by the PartyPlanner. Takes user inputs from the CLI or sets default values

radius = ARGV[1] || 100
home_latitude = ARGV[2] || 53.3381985
home_longitude = ARGV[3] || -6.2592576

puts PartyPlanner.new(ARGV[0], radius, home_latitude, home_longitude).guest_list