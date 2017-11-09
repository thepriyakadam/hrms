class AddNewColumnToSelectedResumes < ActiveRecord::Migration
  def change
    add_column :selected_resumes, :offer_letter_status, :string
  end
end
