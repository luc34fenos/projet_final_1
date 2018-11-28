class Category < ApplicationRecord

	has_many :posts

	validates :title,
				presence: true,
				length: {minimum: 2, message: "titre minimum 5 caracter"}
	
end
