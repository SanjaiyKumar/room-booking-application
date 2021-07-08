ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_sent_at, :remember_created_at, :name, :phoneno, :address, :password, :password_confirmation, :ban_status
  #
  # or
  #
  filter :email , as: :select 
  # permit_params do
  #   permitted = [:email, :encrypted_password, :name, :phoneno, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  action_item :ban , only: :show do
    if !user.ban_status
      link_to "Ban User", ban_admin_user_path(user) , method: :put
    else
      link_to "Unban" ,ban_admin_user_path(user) , method: :put
    end
  end

  member_action :ban , method: :put do
    user = User.find(params[:id])
    user.update(ban_status: !user.ban_status)
    redirect_to admin_user_path(user)
  end
  
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :phoneno
    column :address
    column :ban_status
    column :created_at
    actions
  end
  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :name
      f.input :address
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
      f.input :phoneno      
      f.input :ban_status
    end
    f.actions
  end

end
