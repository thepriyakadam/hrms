class CreateBonusEmployers < ActiveRecord::Migration
  def change
    create_table :bonus_employers do |t|
      t.string :base_component
      t.decimal :limit_amount
      t.decimal :percentage
      t.date :effective_from
      t.date :effective_to
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
