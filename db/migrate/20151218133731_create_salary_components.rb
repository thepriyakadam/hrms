class CreateSalaryComponents < ActiveRecord::Migration
  def change
    create_table :salary_components do |t|
      t.string :code
      t.string :name
      t.string :description
      t.reference :parent, index: true, foreign_key: true
      t.boolean :is_deducted
      t.boolean :is_confirm
      t.timestamps null: false

    end
  end
end
