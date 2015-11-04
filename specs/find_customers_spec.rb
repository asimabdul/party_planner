require_relative "spec_helper.rb"
require_relative "../find_customers.rb"
require_relative "../extract_data.rb"

describe FindCustomers do
  before :example do
    @locations = ExtractData.new("specs/customers_test_data.txt").load_file
  end

  subject { FindCustomers.new(@locations, 100, 53.3381985, -6.2592576) }

  context "Search" do
    it "should find customers within a 100km radius" do
      expect(subject.search).to match_array([@locations[0], @locations[1]])
    end

    it "should return an empty result set when no customers are found" do
      expect(FindCustomers.new(@locations, 1, 53.3381985, -6.2592576).search).to match_array([])
    end
  end

end