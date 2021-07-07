desc "Adding a new column in Hotel"

task :populate_column => :environment do
  hotels=Hotel.all
  hotels.each do |hotel|
    hotel.update(ban_status:false)
  end
end

task :populate_user_column => :environment do
  users=User.all
  users.each do |user|
    user.update(ban_status:false)
  end
end