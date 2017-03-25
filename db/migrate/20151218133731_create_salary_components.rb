class CreateSalaryComponents < ActiveRecord::Migration
  def change
    create_table :salary_components do |t|
      t.string :name
      t.string :is_deducted
      t.string :code
      t.string :description
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
