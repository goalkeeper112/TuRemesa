# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# prueba
['registered', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

admin = Role.find_by_name('admin')

User.create(email: "desarrollo@bitven.org", username: "remesasAdministrator", password: "z4m1r4Gk", first_name: "Luis", last_name: "Fernando", role: admin)
