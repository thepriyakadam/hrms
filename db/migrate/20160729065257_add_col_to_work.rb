class AddColToWork < ActiveRecord::Migration
  def change
  	add_column :workingdays, :pay_leave, :decimal
  end
end
