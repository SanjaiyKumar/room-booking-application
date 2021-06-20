class AddHotelNameToLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :logs , :hotel_name ,:string 
  end
end
