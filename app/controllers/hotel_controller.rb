class HotelController < ApplicationController
    before_action :authenticate_hotel!

    def hotellogs
        @logs =current_hotel.logs.all
    end
end
