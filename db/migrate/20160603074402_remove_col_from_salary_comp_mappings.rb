class RemoveColFromSalaryCompMappings < ActiveRecord::Migration
  def change
    remove_column :salary_comp_mappings, :type, :string
    add_column :salary_comp_mappings, :map_type, :string
  end
end
