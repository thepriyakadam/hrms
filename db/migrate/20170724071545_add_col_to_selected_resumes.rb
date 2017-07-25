class AddColToSelectedResumes < ActiveRecord::Migration
  def change
    add_reference :selected_resumes, :add_by
  end
end
