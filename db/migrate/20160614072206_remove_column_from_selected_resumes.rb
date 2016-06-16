class RemoveColumnFromSelectedResumes < ActiveRecord::Migration
  def change
    remove_column :selected_resumes, :is_confirm, :boolean
    add_column :selected_resumes, :status, :string
  end
end
