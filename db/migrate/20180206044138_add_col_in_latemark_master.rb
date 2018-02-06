class AddColInLatemarkMaster < ActiveRecord::Migration
  def change
  	add_column :latemark_masters, :fullday_working_hrs, :string
  	add_column :latemark_masters, :halfday_working_hrs, :string
  end
end
