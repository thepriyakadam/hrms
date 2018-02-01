class AddColToLatemarkTotal < ActiveRecord::Migration
  def change
    add_column :latemark_totals, :confirm, :string
  end
end
