class Admin::CreateAdminData
  def perform
    create_admin
  end

  private

  def create_admin
    user = User.create(
      {
        fname: "John",
        lname: "Doe",
        email: "admin@admin.com",
        password: "admin123",
        address: "PH",
        role_id: 1,
      }
    )
    if user.save
      puts "Successfully created user Admin"
    else
      puts "Error in seeding"
    end
  end
end
