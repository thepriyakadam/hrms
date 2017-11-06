class CreateFoodCoupanMasters < ActiveRecord::Migration
  def change
    create_table :food_coupan_masters do |t|
      t.string :code
      t.string :name
      t.string :description
      t.decimal :price, precision: 15, scale: 2, default: 0
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
