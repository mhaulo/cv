class RenameResumesPortfoliosToPortfoliosResumes < ActiveRecord::Migration[5.2]
  def change
    rename_table :resumes_portfolios, :portfolios_resumes
  end
end
