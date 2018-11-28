class Panier < ApplicationRecord
  
  	belongs_to :user
  	has_many :commands
  	has_many :posts, through: :command
  	
end
