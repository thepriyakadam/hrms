class AddColToMonthlyExpence < ActiveRecord::Migration
  def change
    add_column :monthly_expences, :description, :text
  end
end
