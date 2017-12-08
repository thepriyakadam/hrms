class AddColToJoiningDetail < ActiveRecord::Migration
  def change
    add_column :joining_details, :is_da, :boolean
  end
end
