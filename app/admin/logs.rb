ActiveAdmin.register Log do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :hotel_id, :user_id, :room_id, :start_date, :end_date, :hotel_name, :room_no
  #
  # or
  #
  permit_params do
    permitted = [:hotel_id, :user_id, :room_id, :start_date, :end_date, :hotel_name, :room_no]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
