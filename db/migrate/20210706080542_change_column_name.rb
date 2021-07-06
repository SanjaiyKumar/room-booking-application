class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :hotels, :address, :address_id
  end
end
