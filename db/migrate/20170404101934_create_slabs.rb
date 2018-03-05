class CreateSlabs < ActiveRecord::Migration
  def change
    create_table :slabs do |t|
      t.decimal :from
      t.decimal :to
      t.decimal :texable_amount
      t.decimal :percentage
      t.boolean :status

      t.timestamps null: false
    end
  end
end
