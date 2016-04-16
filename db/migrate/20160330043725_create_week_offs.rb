class CreateWeekOffs < ActiveRecord::Migration
  def change
    create_table :week_offs do |t|
      t.string :weekoff_date_range
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
