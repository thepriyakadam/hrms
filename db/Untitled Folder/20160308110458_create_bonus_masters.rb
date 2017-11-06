class CreateBonusMasters < ActiveRecord::Migration
  def change
    create_table :bonus_masters do |t|
      t.boolean :is_bouns
      t.decimal :limit_amount, precision: 15, scale: 2, default: 0
      t.decimal :bonus_persentage, precision: 15, scale: 2, default: 0
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
