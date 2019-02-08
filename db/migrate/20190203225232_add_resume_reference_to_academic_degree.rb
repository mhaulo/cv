class AddResumeReferenceToAcademicDegree < ActiveRecord::Migration[5.2]
  def change
    add_reference :academic_degrees, :resume, foreign_key: true
  end
end
