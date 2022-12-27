class Admin::CreateSampleUserData
  def perform
    create_user_data
  end

  private

  def create_user_data
    counter = 1
    10.times do
      user = User.create(
        {
          fname: "User #{counter}",
          lname: "~",
          email: "user@user#{counter}.com",
          password: "user123",
          address: "PH",
          role_id: 3,
        }
      )
      if user.save
        puts "Successfully created User#{counter}"
        counter += 1
      else
        puts "Error in seeding"
      end
    end
  end
end
