ActiveAdmin.register Hotel do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_sent_at, :remember_created_at, :name, :phoneno, :room_count,:address_id, :password, :password_confirmation, :ban_status
  #
  # or
  #
  filter :name , as: :select 
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_sent_at, :remember_created_at, :name, :phoneno, :address_id, :room_count,:ban_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :phoneno
    column :address_id
    column :room_count
    column :created_at
    column :ban_status
    actions
  end
  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :name
      f.input :address_id
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
      f.input :phoneno      
      f.input :room_count 
      f.input :ban_status
    end
    f.actions
  end
end
