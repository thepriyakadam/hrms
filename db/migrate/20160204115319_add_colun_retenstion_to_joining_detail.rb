class AddColunRetenstionToJoiningDetail < ActiveRecord::Migration
  def change
    add_column :joining_details, :have_retention, :boolean
  end
end
