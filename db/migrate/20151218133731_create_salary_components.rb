class CreateSalaryComponents < ActiveRecord::Migration
  def change
    create_table :salary_components do |t|
      t.string :code
      t.string :name
      t.string :description
      t.references :parent
      t.boolean :is_deducted
      t.boolean :is_confirm
      t.string :account_code
      t.boolean :is_active
      t.boolean :is_base
      t.timestamps null: false

    end
  end
end
