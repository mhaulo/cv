class AddResumeReferenceToSkill < ActiveRecord::Migration[5.2]
  def change
    add_reference :skills, :resume, foreign_key: true
  end
end
