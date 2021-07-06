class CreatePincodes < ActiveRecord::Migration[6.1]
  def change
    create_table :pincodes do |t|
      t.integer :pincode

      t.timestamps
    end
  end
end
