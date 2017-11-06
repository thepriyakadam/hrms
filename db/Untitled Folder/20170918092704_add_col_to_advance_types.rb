class AddColToAdvanceTypes < ActiveRecord::Migration
  def change
    add_column :advance_types, :interest, :boolean
    add_column :advance_types, :rate, :decimal
  end
end
