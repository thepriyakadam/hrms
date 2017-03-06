class AddColomnToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :is_new, :boolean
    add_reference :joining_details, :replacement, index: true, foreign_key: true
  end
end
