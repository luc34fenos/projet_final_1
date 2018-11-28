class Post < ApplicationRecord

	belongs_to :category
	belongs_to :panier, optional: true
	
	validates :title,
				presence: true,
				length: {minimum: 5, message: "titre minimum 5 caracter"},
				uniqueness: true
	
end
