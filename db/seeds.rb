# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

1.times do
  user = User.create(
    {
      fname: "John",
      lname: "Doe",
      username: "user1",
      email: "admin@admin.com",
      password: "admin123",
    }
  )
  if user.save
    puts "Successfully created admin user"
  else
    puts "Error in seeding"
  end
end