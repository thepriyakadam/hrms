class AddNewCollToSelectedResumes < ActiveRecord::Migration
  def change
  	add_column :selected_resumes, :shortlist_for_interview, :boolean
  end
end
