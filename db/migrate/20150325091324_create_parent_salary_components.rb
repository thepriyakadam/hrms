class CreateParentSalaryComponents < ActiveRecord::Migration
  def change
    create_table :parent_salary_components do |t|

      t.timestamps null: false
    end
  end
end
