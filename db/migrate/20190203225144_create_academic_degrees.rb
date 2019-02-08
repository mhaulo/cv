class CreateAcademicDegrees < ActiveRecord::Migration[5.2]
  def change
    create_table :academic_degrees do |t|
      t.string :title
      t.string :school
      t.string :start
      t.date :started_at
      t.date :ended_at
      t.text :description

      t.timestamps
    end
  end
end
