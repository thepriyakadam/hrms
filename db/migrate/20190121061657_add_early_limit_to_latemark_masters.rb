class AddEarlyLimitToLatemarkMasters < ActiveRecord::Migration
  def change
    add_column :latemark_masters, :early_limit, :time
  end
end
