class CreateDaMasters < ActiveRecord::Migration
  def change
    create_table :da_masters do |t|
      t.boolean :is_da
      t.decimal :minimum_wages
      t.date :effective_from
      t.date :effective_to
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
