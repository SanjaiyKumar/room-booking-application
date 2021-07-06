class HotelController < ApplicationController
    before_action :authenticate_hotel!

    def hotellogs
        @logs =current_hotel.logs.includes(:user)
    end

    def addaddress
        @hotel = Hotel.find(current_hotel.id)
        if !@hotel.address_id.nil?
            redirect_to root_path, notice: "Address has already been set Added"
        end
    end

    def add
        @hotel = Hotel.find(current_hotel.id)
        if @hotel.address_id.nil?
            address_id = address_params
            @hotel.update(address_id: address_id)
            redirect_to root_path, notice: "Address Added Successfully!!"
        else
            redirect_to root_path, notice: "Already Address Added"
        end
    end

    private
    def address_params
        param=params
        param[:location] = param[:location].capitalize()
        address = Address.new
        address.location= param[:location]
        address.pincode_id = checkPincode(param)
        address.hotel_id = current_hotel.id
        address.save
        return address.id
    end

    def checkPincode(param)
        if Pincode.find_by(pincode: param[:pincode]).nil?
            pincode = Pincode.new
            pincode.pincode = param[:pincode]
            pincode.save
            return pincode.id
        else
            pincode=Pincode.find_by(pincode: param[:pincode])
            return pincode.id
        end
    end

end
