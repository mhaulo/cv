class CreateResumesPortfoliosAssociation < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes_portfolios do |t|
      t.belongs_to :resume, index: true
      t.belongs_to :portfolio, index: true
    end
  end
end
