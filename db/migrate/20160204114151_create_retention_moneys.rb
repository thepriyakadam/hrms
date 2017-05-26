class CreateRetentionMoneys < ActiveRecord::Migration
  def change
    create_table :retention_moneys do |t|
      t.boolean :have_retention
      t.decimal :amount, :decimal, precision: 15, scale: 2
      t.string :no_of_month
      t.string :description
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
