module Api
    module V1
      class HotelsController < ApplicationController
        before_action :doorkeeper_authorize!
        respond_to :json
        protect_from_forgery with: :null_session
        before_action :find_hotel , only: [:show,:update,:destroy,:hotelrooms]
        before_action :findEmail , only: [:create]

        def index
          @hotels = Hotel.all
          render json:@hotels
        end

        def show 
          if @hotel
            render json: {hotel: @hotel ,message: "Successfull"} , status:200
          else
            render json: {error: "No Hotel Found"} , status:400
          end
        end

        def create
          @hotel = Hotel.new
          @hotel.email = params[:email]
          @hotel.password = params[:password]
          @hotel.name = params[:name]
          @hotel.phoneno = params[:phoneno]
          @hotel.address = params[:address]
          @hotel.room_count = params[:room_count]
          if @hotel.save
            render json:@hotel
          else
            render error: {error: "Unable to insert"} , status:400
          end
        end

        def update
          if @hotel
            @hotel.update(hotel_params)
            render json: {hotel:@hotel ,message: "Successfully updated"} , status:200
          else
            render error: {error: "Unable to update"} , status:400
          end
        end

        def destroy
          if @hotel
            @hotel.destroy
            render json: {message: "Successfully Deleted"} , status:200
          else
            render error: {error: "Unable to Delete"} , status:400
          end
        end

        def hotelrooms
          if @hotel
            @rooms = Room.where(hotel_id: @hotel.id)
            render json: {hotel: @hotel , rooms:@rooms , message: "Successfull"} , status:200
          else
            render json: {error: "No Hotel Found"} , status:400
          end
        end

        def find_hotel
          if Hotel.where(id: params[:id]).empty?
            render json:{message:"Hotel not found"} , status:400
          else
            @hotel = Hotel.find(params[:id])
          end  
        end

        def findEmail
          @email = Hotel.find_by(email: params[:email])
          if @email
            render json:{message:"Email Id already exixts"} , status:200
          end
        end

        def hotel_params
          params.require(:hotel).permit(:email, :password, :name , :phoneno , :address , :room_count)
        end

      end
    end
  end