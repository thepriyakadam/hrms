class AddColToSelectedResume < ActiveRecord::Migration
  def change
    add_column :selected_resumes, :current_ctc, :string
  end
end
