class CreatePfMasters < ActiveRecord::Migration
  def change
    create_table :pf_masters do |t|
      t.boolean :is_pf
      t.decimal :percentage, precision: 4, scale: 2
      t.date :date_effective
      t.decimal :min_limit, precision: 15, scale: 2
      t.string :base_component
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
