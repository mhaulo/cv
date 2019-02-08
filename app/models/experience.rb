class Experience < ApplicationRecord
	belongs_to :resume, inverse_of: :experiences
	validates :name, length: {minimum: 1, maximum: 100}
	validates :title, length: {minimum: 1, maximum: 100}
	validates :body, length: {maximum: 1000000}
end
