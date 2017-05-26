class CreateSalaryCompMappings < ActiveRecord::Migration
  def change
    create_table :salary_comp_mappings do |t|
      t.references :salary_component, index: true, foreign_key: true
      t.integer :erp_account_code
      t.string :type

      t.timestamps null: false
    end
  end
end
