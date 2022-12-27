namespace :admin do
  desc "Create admin user data"
  task create_admin: :environment do
    puts "Creating admin user"
    Admin::CreateAdminData.new.perform
  end

end
