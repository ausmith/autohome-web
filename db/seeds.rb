# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.find_by_id( 1 )
if u == nil || u.email != "root@example.com"
  root_admin = User.create(first_name: 'Root', last_name: 'Admin', id: 1, email: "root@example.com", password: "password", admin: true)
  root_admin.confirm!
end
