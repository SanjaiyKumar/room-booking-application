class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :location
      t.integer :pincode_id

      t.timestamps
    end
    add_index :addresses, :pincode_id
  end
end
