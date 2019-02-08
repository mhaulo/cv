class Resume < ApplicationRecord
	has_many :experiences, inverse_of: :resume, dependent: :destroy
	has_many :academic_degrees, inverse_of: :resume, dependent: :destroy
	has_many :skills, inverse_of: :resume, dependent: :destroy
	has_and_belongs_to_many :portfolios
	belongs_to :user
	
	has_one_attached :picture
	
	accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :academic_degrees, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
	
	validates :name, length: {minimum: 1, maximum: 100}
	validates :email, length: {minimum: 1, maximum: 100}
	validates :phone, length: {minimum: 1, maximum: 100}
end
