class AddColToLatemarkMasters < ActiveRecord::Migration
  def change
    add_column :latemark_masters, :late_limit, :time
  end
end
