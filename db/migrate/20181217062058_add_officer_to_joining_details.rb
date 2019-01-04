class AddOfficerToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :chief_operating_officer, :boolean
    add_column :joining_details, :head_officer, :boolean
  end
end
