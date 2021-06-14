class AddHotelIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :hotel_id, :integer
    add_index :rooms, :hotel_id
  end
end
