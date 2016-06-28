class AddColumnToSelectedResumes < ActiveRecord::Migration
  def change
    add_column :selected_resumes, :is_confirm, :boolean
  end
end
