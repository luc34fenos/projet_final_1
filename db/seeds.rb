# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

add = User.new(firstname: "admin", lastname: "admin", email: "admin@dev.mg", password: "root", password_confirmation: "root", confirmed: true, admin: true)
add.save
add.update(confirmation_token: nil)
add.save(validate: false)


#Category.create(title: 'Chatton')
#Category.create(title: 'Mouton')
#Category.create(title: 'Aligator')


=begin
User.create(firstname: "NAME#{t}", lastname: "last#{t}", email: "email@ex#{t}.com",
password: "pass#{t}", password_confirmation: "pass#{t}", confirmed: true, confirmation_token: nil)
=end