class AddNewColToTrainees < ActiveRecord::Migration
  def change
    add_column :trainees, :is_complete, :boolean
  end
end
