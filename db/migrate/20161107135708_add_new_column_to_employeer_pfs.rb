class AddNewColumnToEmployeerPfs < ActiveRecord::Migration
  def change
    add_column :employeer_pfs, :actual_amount, :decimal
  end
end
