class AddNewColumnToDueDetails < ActiveRecord::Migration
  def change
    add_column :due_details, :is_confirmed, :boolean
  end
end
