class CreateLateMarkMasters < ActiveRecord::Migration
  def change
    create_table :late_mark_masters do |t|
      t.string :from
      t.string :to
      t.string :late_mark
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
