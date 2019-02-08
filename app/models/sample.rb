class Sample < ApplicationRecord
	belongs_to :portfolio, inverse_of: :samples
	has_one_attached :picture
	
	validates :title, length: {minimum: 1, maximum: 100}
	validates :body, length: {maximum: 1000000}
end
