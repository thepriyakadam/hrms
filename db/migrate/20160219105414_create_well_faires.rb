class CreateWellFaires < ActiveRecord::Migration
  def change
    create_table :well_faires do |t|
      t.string :month
      t.decimal :amount, precision: 15, scale: 2, default: 0
      t.string :status
      t.boolean :is_confirm
      t.boolean :status
      t.timestamps null: false
    end
  end
end
