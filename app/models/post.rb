class Post < ApplicationRecord

	belongs_to :category
	has_many :commands
	has_many :paniers, through: :command

	has_one_attached :img
	
	validates :title,
				presence: true,
				length: {minimum: 5, message: "titre minimum 5 caracter"},
				uniqueness: true
	
end
