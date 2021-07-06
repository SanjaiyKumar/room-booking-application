class AddHotelIdToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :hotel_id, :integer
    add_index :addresses, :hotel_id
  end
end
