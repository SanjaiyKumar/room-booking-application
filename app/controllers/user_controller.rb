class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    @hotels = Hotel.all
    @hotels = Hotel.order("id")
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def showroom
    @hotel = Hotel.find(params[:id])
    @rooms = @hotel.rooms.where(status: true)
    @count = @hotel.rooms.where(status: true).count
  end

end
