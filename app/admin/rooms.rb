ActiveAdmin.register Room do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :hotel_name, :status, :price, :room_type, :no_of_beds, :hotel_id, :room_no
  #
  # or
  #
  # permit_params do
  #   permitted = [:hotel_name, :status, :price, :room_type, :no_of_beds, :hotel_id, :room_no]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :hotel_name
    column :status
    column :price
    column :room_type
    column :no_of_beds
    column :hotel_id
    column :room_no
    actions
  end
end
