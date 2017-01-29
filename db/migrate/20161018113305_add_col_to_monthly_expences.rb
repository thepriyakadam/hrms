class AddColToMonthlyExpences < ActiveRecord::Migration
  def change
    add_column :monthly_expences, :is_paid, :boolean
  end
end
