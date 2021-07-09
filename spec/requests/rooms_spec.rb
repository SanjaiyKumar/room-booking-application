require 'rails_helper'

RSpec.describe "Rooms", type: :request do
    hotel = Hotel.first_or_create!(email:"test@test.com",password:"Qwert!13svs4",name:"Adengappa",phoneno:"7894161131",address_id:"1",room_count:5)
    let (:params) {{room_no:"A01",room_type:"AC",no_of_beds:4,price:500,hotel_id:hotel.id,hotel_name:hotel.name,status: true}}
    let (:update_params) {{room_no:"A06",room_type:"NON-AC",no_of_beds: 4, price:500 ,hotel_id:hotel.id,hotel_name:hotel.name,status:true}}

    context "Get #index" do
      it "Successfull Response" do
        get rooms_path
        expect(response).to be_successful
      end
    end

    context "Get #show" do
      it "Not Successfull Response" do
        room = create(:room,hotel_id:hotel.id)
        get room_path(room)
        expect(response).to_not be_successful
      end
      it "Successfull Response" do
        sign_in hotel
        room = create(:room,hotel_id:hotel.id)
        get room_path(room)
        expect(response).to be_successful
      end
    end

    context "Post #create" do
      it "Not Successfull Response" do
        post rooms_path(:room,hotel_id:hotel.id)
        expect(response).to_not be_successful
      end
      it "Successfull Response" do
        # sign_in hotel
        allow_any_instance_of(RoomsController).to receive(:authenticate_hotel!) {true}
        allow_any_instance_of(RoomsController).to receive(:current_hotel) {hotel}
        post rooms_path(room: params)
        expect(response).to have_http_status(302)
      end
    end

    context "Post #update" do
      it "Not Successfull Response" do
        room = create(:room,hotel_id:hotel.id)
        put rooms_path+"/"+room.id.to_s , params: {room:update_params}
        expect(response).to_not be_successful
      end
      it "Successfull Response" do
        allow_any_instance_of(RoomsController).to receive(:authenticate_hotel!) {true}
        allow_any_instance_of(RoomsController).to receive(:current_hotel) {hotel}
        room = create(:room,hotel_id:hotel.id)
        put rooms_path+"/"+room.id.to_s , params: {room:update_params}
        expect(response).to have_http_status(302)
      end
    end

    context "Post #destroy" do
      it "Not Successfull Response" do
        room = create(:room,hotel_id:hotel.id)
        delete rooms_path+"/"+room.id.to_s
        expect(response).to_not be_successful
      end
      it "Successfull Response" do
        allow_any_instance_of(RoomsController).to receive(:authenticate_hotel!) {true}
        allow_any_instance_of(RoomsController).to receive(:current_hotel) {hotel}
        room = create(:room,hotel_id:hotel.id)
        delete rooms_path+"/"+room.id.to_s
        expect(response).to have_http_status(302)
      end
    end

    context "Hotel Dashboard Flow" do
      it "Successfull Response /rooms" do
        allow_any_instance_of(RoomsController).to receive(:authenticate_hotel!) {true}
        get '/rooms'
        expect(response).to render_template 'rooms/index'
      end
      it "Successfull Response /rooms/new" do
        allow_any_instance_of(RoomsController).to receive(:authenticate_hotel!) {true}
        allow_any_instance_of(RoomsController).to receive(:current_hotel) {hotel}
        get '/rooms'
        get '/rooms/new'
        expect(response).to render_template 'rooms/new'
      end
      it "Successfull Response /rooms/:id" do
        allow_any_instance_of(RoomsController).to receive(:authenticate_hotel!) {true}
        allow_any_instance_of(RoomsController).to receive(:current_hotel) {hotel}
        get '/rooms'
        room = create(:room,hotel_id:hotel.id)
        get "/rooms/#{room.id}"
        expect(response).to render_template 'rooms/show'
      end
    end

end
