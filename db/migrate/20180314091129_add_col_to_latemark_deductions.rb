class AddColToLatemarkDeductions < ActiveRecord::Migration
  def change
    add_column :latemark_deductions, :paid, :boolean
    add_column :latemark_deductions, :comment, :string
  end
end
