require_relative "spec_helper.rb"
require_relative "../distance_calculator.rb"

describe DistanceCalculator do
  subject { DistanceCalculator.new(53.3381985, -6.2592576, 52.986375, -6.043701) }
  
  context "Degree to radians" do
    it "should convert the given degree to radians" do
      expect(subject.to_radians(1).round(7)).to eq(0.0174533)
    end
  end

  context "Distance between 2 locations" do
    it "should calculate the distance between 2 coordinates in kilometers using the law of cosines" do
      calculator = DistanceCalculator.new(53.3381985, -6.2592576, 53.1229599, -6.2705202)
      expect(calculator.distance_between_2_points.round(3)).to eq(23.945)
    end
  end

end