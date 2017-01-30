class RemoveReffFromAttributeMaster < ActiveRecord::Migration
  def change
  	remove_reference :attribute_masters, :department, index: true, foreign_key: true
  	remove_reference :goal_perspectives, :department, index: true, foreign_key: true
  end
end