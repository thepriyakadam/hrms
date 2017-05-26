class AddColToTrainees < ActiveRecord::Migration
  def change
    add_column :trainees, :feedback, :text
  end
end
