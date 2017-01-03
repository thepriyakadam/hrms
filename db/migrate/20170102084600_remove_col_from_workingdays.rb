class RemoveColFromWorkingdays < ActiveRecord::Migration
  def change
    add_column :joining_details, :ot_rate, :string
  end
end
