class AddColToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :welfare, :boolean
  end
end
