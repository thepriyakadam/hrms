class AddColumnToCaptureResumes < ActiveRecord::Migration
  def change
    add_column :capture_resumes, :job_title, :string
  end
end
