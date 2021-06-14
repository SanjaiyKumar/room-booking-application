class AddNameToHotel < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :name, :string
    add_column :hotels, :phoneno, :string
    add_column :hotels, :address, :string
    add_column :hotels, :room_count, :integer
  end
end
