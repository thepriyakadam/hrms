 CreateTransportAllowances < ActiveRecord::Migration
  def change
    create_table :transport_allowances do |t|
      t.references :employee, index: true, foreign_key: true
      t.boolean :option
      t.decimal :amount
      t.boolean :status

      t.timestamps null: false
    end
  end
end
