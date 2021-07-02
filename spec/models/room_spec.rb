require 'rails_helper'

RSpec.describe Room, type: :model do
  
  before do
    @hotel = create(:hotel)
  end

  context "Validation Test" do
    it "check price presence" do
      room = build(:room , price:nil ,hotel_id:@hotel.id)
      expect(room.save).to eq(false)
    end
    it "check room_type presence" do
      room= Room.new(room_no:'r1',price:500,no_of_beds:4,hotel_id:@hotel.id).save
      expect(room).to eq(false)
    end
    it "check no_of_beds presence" do
      room= Room.new(room_no:'r1',room_type:'AC',price:4000,hotel_id:@hotel.id).save
      expect(room).to eq(false)
    end
    it "check room_no presence" do
      room= Room.new(price:500,room_type:'AC',no_of_beds:4,hotel_id:@hotel.id).save
      expect(room).to eq(false)
    end
    it "check hotel_id presence" do
      room= Room.new(price:500,room_type:'AC',no_of_beds:4,room_no:'r1').save
      expect(room).to eq(false)
    end
    it "save successfully" do
      room= create(:room,hotel_id:@hotel.id)
      expect(room.persisted?).to eq(true)
    end
  end

end
