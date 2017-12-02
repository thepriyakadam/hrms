class AddCoToSelectedResume < ActiveRecord::Migration
  def change
    add_column :selected_resumes, :contact_no2, :string
  end
end
