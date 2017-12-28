class CreateSalaryTemplates < ActiveRecord::Migration
  def change
    create_table :salary_templates do |t|
      t.string :code
      t.string :description
      t.date :validity_date
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
