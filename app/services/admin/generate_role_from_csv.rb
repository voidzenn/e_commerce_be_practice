require "csv"

class Admin::GenerateRoleFromCSV
  def perform
    remove_all_roles
    create_roles
  end

  private

  def remove_all_roles
    puts "Removing roles"
    Role.delete_all
    puts "Removed all the roles"
  end

  def create_roles
    ctr = 1
    CSV.foreach(("#{Rails.root}/lib/csv/roles.csv"), headers: true, col_sep: ",") do |row|
      name = row[1].to_s

      begin
        Role.create(id: ctr, name: name)
        ctr += 1
      rescue Exception => e
        puts e
      end
    end
  end
end
