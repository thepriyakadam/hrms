class AddColumnToSalaryComponent < ActiveRecord::Migration
  def change
    add_reference :salary_components, :parent, index: true, foreign_key: true
  end
end
