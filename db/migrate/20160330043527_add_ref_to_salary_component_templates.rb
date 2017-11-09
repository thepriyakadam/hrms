class AddRefToSalaryComponentTemplates < ActiveRecord::Migration
  def change
    add_reference :salary_component_templates, :parent, index: true, foreign_key: true
  end
end
