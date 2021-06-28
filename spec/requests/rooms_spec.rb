require 'rails_helper'

RSpec.describe "Rooms", type: :request do
    hotel = Hotel.first_or_create!(email:"test@test.com",password:"Qwert!13svs4",name:"Adengappa",phoneno:"7894161131",address:"Coimbatore",room_count:5)
    let (:params) {{room_no:"A06",room_type:"AC",no_of_beds:4,price:500,hotel_id:hotel.id,hotel_name:"Paradox",status: true}}

    context "Get #index" do
      it "Successfull Response" do
        get rooms_path
        expect(response).to be_successful
      end
    end

    context "Get #show" do
      it "Not Successfull Response" do
        room =Room.create(params)
        get room_path(room)
        expect(response).to_not be_successful
      end
      it "Successfull Response" do
        sign_in hotel
        room =Room.create(params)
        get room_path(room)
        expect(response).to be_successful
      end
    end

    context "Post #create" do
      it "Not Successfull Response" do
        post rooms_path(params)
        expect(response).to_not be_successful
      end
      it "Successfull Response" do
        sign_in hotel
        post rooms_path(room:params)
        expect(response).to be_successful
      end
    end

end
