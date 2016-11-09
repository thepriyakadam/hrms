class AddColToSalaryTemplate < ActiveRecord::Migration
  def change
    add_column :salary_templates, :is_active, :boolean
    add_column :salary_templates, :is_confirm, :boolean
  end
end
