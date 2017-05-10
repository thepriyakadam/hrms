class CreateEsicMasters < ActiveRecord::Migration
  def change
    create_table :esic_masters do |t|
      t.boolean :esic
      t.decimal :percentage, :decimal, precision: 15, scale: 2, default: 0
      t.date :date_effective
      t.decimal :max_limit, :decimal, precision: 15, scale: 2, default: 0
      t.string :base_component
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
