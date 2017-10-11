class ChangeEventDataType < ActiveRecord::Migration
  def change
  	change_column :events, :start_time, :date
  end
end
