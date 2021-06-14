class AddRoomNoToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_no, :string
  end
end
