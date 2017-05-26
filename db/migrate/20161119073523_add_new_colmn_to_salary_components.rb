class AddNewColmnToSalaryComponents < ActiveRecord::Migration
  def change
    add_column :salary_components, :is_base, :boolean
  end
end
