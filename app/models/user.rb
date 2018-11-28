class User < ApplicationRecord

	has_one :paniers

	validates :firstname,
				presence: true,
				length: {minimum: 3, maximum: 55}

	validates :lastname,
				presence: true,
				length: {minimum: 3, maximum: 55}
	
	validates :email,
				presence: true,
				length: {maximum: 255, message: "maximum 255 caracter"},
				format: {with: /\A([\w\-\.]+@[A-Za-z]+\.[a-z]{3,8})\z/},
				uniqueness: {case_sensitive: false}

	has_secure_password

	has_secure_token :confirmation_token

end
