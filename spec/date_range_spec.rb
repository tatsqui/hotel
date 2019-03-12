require_relative 'spec_helper'
require 'date'

describe "DateRange" do 
  before do
    @date_range = DateRange.new(
      check_in: "2019-03-03", 
      check_out: "2019-03-05")
  end
  
  describe "initialize" do 
    it "is an instance of a booking" do 
      expect(@date_range).must_be_kind_of DateRange
    end

    it "must accurately record check-in date" do 
      expect(@date_range).must_respond_to :check_in
      expect(@date_range.check_in).must_equal  Date.parse("2019-03-03")
    end

    it "must accurately record check-out date" do 
      expect(@date_range).must_respond_to :check_out
      expect(@date_range.check_out).must_equal Date.parse("2019-03-05")
    end
  end

  describe "valid_date?" do 
    it "raises an exception for an invalid check-in day" do 
     expect{ DateRange.new(
        check_in: "March 100th 2019", 
        check_out: "03-05-2019",
        number_of_rooms: 1)
     }.must_raise ArgumentError
    end

    it "raises an exceptions for an invalid check-out day" do 
      expect{ DateRange.new(
         check_in: "March 10th 2019", 
         check_out: "03-205-2019",
         number_of_rooms: 1)
      }.must_raise ArgumentError
    end
  end
  
  describe "date_range_valid?" do
    it "raises an exception for a check-out date that occurs before check-in" do 
      check_in = "03-05-2019"
      check_out = "02-05-2019"
      expect {
        DateRange.new(check_in, check_out)
        }.must_raise ArgumentError
    end
  end
end