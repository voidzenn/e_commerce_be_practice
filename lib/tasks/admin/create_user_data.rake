namespace :admin do
  desc "Create sample user data"
  task create_user_data: :environment do
    puts "Creating user data"
    Admin::CreateSampleUserData.new.perform
    puts "Created the roles data"
  end
end
