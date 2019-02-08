class AddResumeReferenceToExperience < ActiveRecord::Migration[5.2]
  def change
    add_reference :experiences, :resume, foreign_key: true
  end
end
