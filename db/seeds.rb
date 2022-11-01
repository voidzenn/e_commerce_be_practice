# role_types = ["admin", "seller", "customer"]
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
