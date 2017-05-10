class CreateShiftMasters < ActiveRecord::Migration
  def change
    create_table :shift_masters do |t|
      t.integer :code
      t.string :name
      t.text :description
      t.boolean :is_confirm
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
