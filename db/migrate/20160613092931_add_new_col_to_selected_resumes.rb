class AddNewColToSelectedResumes < ActiveRecord::Migration
  def change
    add_column :selected_resumes, :job_title, :string
  end
end
