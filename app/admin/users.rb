ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phoneno, :address
  #
  # or
  #
  filter :email , as: :select 
  permit_params do
    permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phoneno, :address]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :phoneno
    column :address
    column :created_at
    actions
  end

end
