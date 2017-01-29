class ChangeColumnToSalaryComponent < ActiveRecord::Migration
  def change
    change_column :salary_components, :is_deducted, :boolean
  end
end
