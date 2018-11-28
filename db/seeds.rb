# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(firstname: "admin", lastname: "admin", email: "fef@fef.fef", password: "root", password_confirmation: "root", confirmed: true, confirmation_token: nil)

(1..5).to_a.each{|t|
	Category.create(title: "category#{t}");
	User.create(firstname: "NAME#{t}", lastname: "last#{t}", email: "email@ex#{t}.com", password: "pass#{t}", password_confirmation: "pass#{t}", confirmed: true, confirmation_token: nil)
}

20.times{|u|
	Post.create(title: "post#{u}", description: "description cool numero #{u}", nombre: 8, price: 6, category_id: u%5 )
}