class AddBlockedColumnToUser < ActiveRecord::Migration[6.1]
  def change
      add_column :users, :ban_status, :boolean
  end
end
