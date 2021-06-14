class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :hotel_name
      t.boolean :status
      t.integer :price
      t.string :type
      t.integer :no_of_beds

      t.timestamps
    end
  end
end
