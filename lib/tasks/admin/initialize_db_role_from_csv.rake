namespace :admin do
  desc "Create db role table with data in the role csv"
  task initialize_db_role_from_csv: :environment do
    puts "Creating roles data"
    Admin::GenerateRoleFromCSV.new.perform
  end
end
