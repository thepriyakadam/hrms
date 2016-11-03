class CreateFpMasters < ActiveRecord::Migration
  def change
    create_table :fp_masters do |t|
      t.boolean :is_fp
      t.decimal :min_limit
      t.decimal :percentage
      t.string :base_component
      t.date :effective_from
      t.date :effective_to
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
