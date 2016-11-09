class RemoveColFromJoiningDetail < ActiveRecord::Migration
  def change
    remove_column :joining_details, :base_component, :string
  end
end
