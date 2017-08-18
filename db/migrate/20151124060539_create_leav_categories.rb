class CreateLeavCategories < ActiveRecord::Migration
  def change
    create_table :leav_categories do |t|
      t.string :code
      t.string :name
      t.string :description
      t.boolean :is_confirm
      t.boolean :is_payble

      t.decimal :from
      t.decimal :to
      t.boolean :is_active
      t.boolean :is_balance
      t.string :limit
      t.boolean :is_limit
      t.boolean :is_cashable
      t.boolean :assign_balance
      t.boolean :is_continuous
      t.decimal :monthly_leave


      t.timestamps null: false
    end
  end
end
