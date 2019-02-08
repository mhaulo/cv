class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :title
      t.text :body
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
