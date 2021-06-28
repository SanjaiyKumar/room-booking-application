require 'rails_helper'

RSpec.describe Room, type: :model do
  
  before do
    @hotel = Hotel.new(email:"test@tet.com",password:"Qwert!13svs4",name:"Adengappa",phoneno:"7894561131",address:"Coimbatore",room_count:5)
    @hotel.save
  end

  context "Validation Test" do
    it "check price presence" do
      room= Room.new(room_no:'r1',room_type:'AC',no_of_beds:4,hotel_id:@hotel.id).save
      expect(room).to eq(false)
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
      room= Room.new(room_no:"A06",room_type:"AC",no_of_beds:4,price:500,hotel_id:@hotel.id,hotel_name:"Paradox",status: true).save
      expect(room).to eq(true)
    end
  end

end
