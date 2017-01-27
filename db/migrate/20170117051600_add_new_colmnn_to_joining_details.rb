class AddNewColmnnToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :time_master, :boolean
    add_column :joining_details, :time_adjusted, :boolean
  end
end
