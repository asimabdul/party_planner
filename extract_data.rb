require "oj"

class InvalidRecord < StandardError; end

class ExtractData
  attr_accessor :data_file
  
  def initialize(data_file)
    @data_file = data_file
  end

  #validates and loads the data file into a Hash
  def load_file
    File.readlines(@data_file).collect do |line|
      begin
        record = Oj.load(line)
        validate_record(record)
        record
      rescue
        puts "Found invalid record in data file. Skipping..."
        next
      end
    end.compact
  end

  private
  def validate_record(record)
    %w[user_id latitude longitude name].each {|data_field| raise InvalidRecord if data_field.nil? || data_field.empty?}
  end

end