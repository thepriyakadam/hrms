class CreateAdvanceTypes < ActiveRecord::Migration
  def change
    create_table :advance_types do |t|
      t.string :code
      t.string :name
      t.string :description
      t.boolean :is_confirm
      t.boolean :intrest
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
