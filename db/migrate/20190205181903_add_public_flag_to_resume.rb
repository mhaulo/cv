class AddPublicFlagToResume < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :public, :boolean, default: false
  end
end
