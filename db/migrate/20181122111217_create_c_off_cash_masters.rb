class CreateCOffCashMasters < ActiveRecord::Migration
  def change
    create_table :c_off_cash_masters do |t|
      t.string :base_component
      t.string :rate
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
