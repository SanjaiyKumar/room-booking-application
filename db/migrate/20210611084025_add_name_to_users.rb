class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phoneno, :string
    add_column :users, :address, :string
  end
end
