class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.integer :hotel_id
      t.integer :user_id
      t.integer :room_id
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
    add_index :logs, :hotel_id
    add_index :logs, :user_id
    add_index :logs, :room_id
  end
end
