class AcademicDegree < ApplicationRecord
	belongs_to :resume, inverse_of: :academic_degrees
end
