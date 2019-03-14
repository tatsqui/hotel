require_relative "spec_helper"
require "date"

describe "RoomBooker" do
  before do
    @Hotel = RoomBooker.new
  end

  describe "instantiation" do
    it "creates a list of all 20 rooms" do
      expect(@Hotel.rooms).must_be_kind_of Array
    end
  end

  describe "list_all_rooms" do
    before do
      @Hotel = RoomBooker.new
    end
    it "all items in list are an instance of Room" do
      @Hotel.rooms.each do |room|
        expect(room).must_be_kind_of Room
      end
    end

    it "records room id correctly" do
      expect(@Hotel.rooms[0].id).must_equal 1
    end
  end

  describe "make_reservation" do
    before do
      @Hotel = RoomBooker.new
      @Hotel.make_reservation("March 10 2019", "March 15th 2019")
      @Hotel.make_reservation("March 22 2019", "March 30th 2019")
    end
    it "can add a reservation to list of reservations" do
      expect(@Hotel.list_reservations.length).must_equal 2
    end

    it "accurately records reservation id" do
      expect(@Hotel.rooms[0].id).must_equal 1
      expect(@Hotel.rooms[1].id).must_equal 2
    end

    it "returns nil for a reservation id that does not exist" do
      # implement this if searching for reservation id
    end

    it "raises an argument error if given invalid check-in" do
      expect {
        @Hotel.make_reservation("March 10th 2019", "March 15th 2019").must_raise ArgumentError
      } # THIS TEST SHOULD FAIL BUT IT PASSES!!!
    end
  end

  describe "find by reservation date" do
    before do 
      # @Hotel.make_reservation("March 3rd 2019", "March 6th 2019")
    end
    it "can look up all reservations for a given date" do
    end

    it "will return nil if no reservations are made on that date" do
    end
  end
end
