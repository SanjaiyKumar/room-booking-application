module Api
    module V1
      class HotelsController < ApplicationController
        respond_to :json
        protect_from_forgery with: :null_session
        before_action :find_hotel , only: [:show,:update,:destroy]
  
        def index
          @hotels = Hotel.all
          render json:@hotels
        end

        def show 
          render json:@hotel
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
            render json: {message: "Successfully updated"} , status:200
          else
            render error: {error: "Unable to update"} , status:400
          end
        end

        def destroy
          if @hotel
            @hotel.destroy
            render json: {message: "Successfully Deleted"} , status:200
          else
            render error: {error: "Unable to update"} , status:400
          end
        end

        def find_hotel
          @hotel = Hotel.find(params[:id])
        end

        def hotel_params
          params.require(:hotel).permit(:email, :password, :name , :phoneno , :address , :room_count)
        end

      end
    end
  end