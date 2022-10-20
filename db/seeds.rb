# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# role_types = ["admin", "shopkeeper", "user"]
# role_types.each do |type|
#   roles = Role.create(
#     {
#       name: type,
#     }
#   )
#   if roles.save
#     puts "Successfully created role #{type.capitalize}"
#   else
#     puts "Error in seeding"
#   end
# end

# 1.times do
#   user = User.create(
#     {
#       fname: "John",
#       lname: "Doe",
#       email: "admin@admin.com",
#       password: "admin123",
#       role_id: 1,
#     }
#   )
#   if user.save
#     puts "Successfully created user Admin"
#   else
#     puts "Error in seeding"
#   end
# end

# counter = 0
# 10.times do
#   new_val = counter += 1
#   user = User.create(
#     {
#       fname: "User #{new_val}",
#       lname: "~",
#       email: "user@user#{new_val}.com",
#       password: "admin123",
#       role_id: 3,
#     }
#   )
#   if user.save
#     puts "Successfully created User#{new_val}"
#   else
#     puts "Error in seeding"
#   end
# end