class AddColToSalaryComponent < ActiveRecord::Migration
  def change
    add_column :salary_components, :is_active, :boolean
  end
end
