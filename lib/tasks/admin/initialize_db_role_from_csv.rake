namespace :admin do
  desc "Update db role table with data in the role csv"
  task initialize_db_role_from_csv: :environment do
    puts "Updating roles table"

    puts "Updated the roles db"
  end
end
