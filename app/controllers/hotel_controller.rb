class HotelController < ApplicationController
    before_action :authenticate_hotel!

    def hotellogs
        @logs =current_hotel.logs.includes(:user)
    end
end
