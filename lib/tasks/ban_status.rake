desc "Updating new columns in Hotel"

task :populate_ban_status_hotel_table => :environment do
  hotels=Hotel.all
  hotels.each do |hotel|
    hotel.update(ban_status:false)
  end
end

task :populate_ban_status_user_table => :environment do
  users=User.all
  users.each do |user|
    user.update(ban_status:false)
  end
end