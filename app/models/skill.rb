class Skill < ApplicationRecord
	belongs_to :resume, inverse_of: :skills
	
	validates :title, length: {minimum: 1, maximum: 100}
	validates :description, length: {maximum: 1000000}
	validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
end
