class AddCoToSelectedResume < ActiveRecord::Migration
  def change
    add_column :selected_resumes, :current_ctc, :decimal
  end
end
