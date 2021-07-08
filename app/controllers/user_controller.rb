class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    #Using PLUCK
    # @address = Address.where(location: params[:location])
    # @hotel_ids = @address.pluck(:hotel_id)
    # @hotels=Hotel.where(id: @hotel_ids)

    #Using JOINS
    if params[:location] != ""
      @hotels = Hotel.joins(:address).where("addresses.location = ? ", params[:location].capitalize)
    elsif params[:pincode] !=""
      @hotels = Hotel.joins(:pincode).where("pincode= #{params[:pincode]}")
    elsif params[:location] != "" && params[:pincode] !=""
      @hotels = Hotel.joins(:address).where("addresses.location = ? ", params[:location].capitalize)
    else
      redirect_to search_hotel_path, notice: "Enter Pincode or Location to search for Hotels"
    end
    
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def roomlist
    @hotel = Hotel.find(params[:id])
    @rooms = @hotel.rooms.where(status: true)
    @count = @hotel.rooms.where(status: true).count
  end

  def searchhotel
  end

  def bookingpage
    @room = Room.find(params[:id])
  end

  def book 
    @log = current_user.logs.build
    @log.hotel_id= params[:hotel_id]
    @log.room_id= params[:room_id]
    @log.hotel_name= params[:hotel_name]
    @log.start_date= params[:start_date]
    @log.end_date= params[:end_date]
    @log.user_id= params[:user_id]
    @log.room_no= params[:room_no]

      $rom = Room.find(params[:id])
      respond_to do |format|
        if @log.save
          format.html { redirect_to root_path, notice: "Room was successfully Booked." }
        else
          format.html { redirect_to user_bookingpage_path , notice: "Give a Valid Start Date and End Date " }
        end
    end
    
  end

  def showlogs
    @logs = current_user.logs.all

    @hotels = current_user.hotels.distinct
    @count = @logs.group(:hotel_name).count

    @room_nos = @logs.joins(:hotel).distinct.pluck(:room_no,:hotel_name)
  end

  # def validDate(sdate,edate)
  #   valid = false
  #   if Date.today == Date.parse(sdate) || Date.today < Date.parse(sdate)
  #     valid = true
  #   end
  #   if Date.parse(sdate) < Date.parse(edate) ||  Date.parse(sdate) == Date.parse(edate)
  #     valid = true
  #   else
  #     valid = false
  #   end
  #   return valid
  # end

end
