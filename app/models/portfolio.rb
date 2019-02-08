class Portfolio < ApplicationRecord
	has_many :samples, inverse_of: :portfolio, dependent: :destroy
	has_one_attached :picture
	has_and_belongs_to_many :resumes
	accepts_nested_attributes_for :samples, reject_if: :all_blank, allow_destroy: true
	belongs_to :user
	
	has_one_attached :picture
	
	validates :name, length: {minimum: 1, maximum: 100}
	validates :description, length: {maximum: 1000000}
end
