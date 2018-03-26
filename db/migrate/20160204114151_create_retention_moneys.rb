class CreateRetentionMoneys < ActiveRecord::Migration
  def change
    create_table :retention_moneys do |t|
      t.boolean :have_retention
      t.decimal :amount, :decimal, precision: 15, scale: 2
      t.string :no_of_month
      t.string :description
      t.boolean :is_confirm

    t.decimal :persent
    t.string :max_limit
    t.string :base_component
    t.boolean :is_active
    t.string :is_persent

      t.timestamps null: false
    end
  end
end
