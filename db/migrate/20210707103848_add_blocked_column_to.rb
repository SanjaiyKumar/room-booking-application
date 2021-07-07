class AddBlockedColumnTo < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :ban_status, :boolean
  end
end
