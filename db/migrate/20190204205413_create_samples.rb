class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.string :title
      t.text :body
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
