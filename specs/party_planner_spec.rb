require_relative "spec_helper.rb"
require_relative "../party_planner.rb"

describe PartyPlanner do

  subject {PartyPlanner.new("specs/customers_test_data.txt" ,100 ,53.3381985, -6.2592576)}

  context "Given a data file" do
    it "should extract the data, compute the distance and print the guest list" do
      expect {subject.guest_list}.to output(/Guest list/).to_stdout
    end
  end

  context "In case of an error during processing" do
    it "should terminate with an error message" do
      allow_any_instance_of(ExtractData).to receive(:load_file).and_return(nil)
      expect {subject.guest_list}.to output(/error retrieving/).to_stdout
    end
  end

end