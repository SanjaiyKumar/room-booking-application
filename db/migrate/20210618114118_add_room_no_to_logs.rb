class AddRoomNoToLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :logs , :room_no ,:string
  end
end
