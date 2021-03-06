class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :authenticate_hotel! , except: [:index]
  before_action :correct_hotel , only: [:show,:edit, :update ,:destroy]

  # GET /rooms or /rooms.json
  def index
    if !current_hotel.nil?
      @rooms = Room.where(hotel_id:current_hotel.id).order("room_no")
      respond_to do |format|
        format.html
        format.csv {send_data @rooms.to_csv}
      end
    end
    if !current_user.nil?
      @near_by_hotels = Hotel.joins(:address).where("addresses.location = ? ",current_user.address)
    end
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    # @room = Room.new
    @room = current_hotel.rooms.build
  end

  # GET /rooms/1/edit
  def edit
  end

  def changestatus
    @room = Room.find(params[:id])
    @stat = !@room.status
    @room.update(status: @stat)
    redirect_to rooms_url
  end
  
  # POST /rooms or /rooms.json
  def create
    # @room = Room.new(room_params)
    @room = current_hotel.rooms.build(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_hotel
    @room = current_hotel.rooms.find_by(id: params[:id])
    redirect_to rooms_path , notice: "Not Authorized" if @room.nil?
  end

  def import
    room = Room.import(params[:file])
    if room.persisted?
      redirect_to root_path, notice: "Rooms imported successfully"
    else
      redirect_to root_path, notice: room.errors.full_messages
    end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:hotel_name, :status, :price, :room_type, :no_of_beds,:hotel_id,:room_no)
    end
end
