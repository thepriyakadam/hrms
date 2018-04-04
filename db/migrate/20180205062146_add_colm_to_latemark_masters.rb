class AddColmToLatemarkMasters < ActiveRecord::Migration
  def change
    add_column :latemark_masters, :halfday_allow, :boolean
  end
end
