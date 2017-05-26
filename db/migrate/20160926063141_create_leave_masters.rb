class CreateLeaveMasters < ActiveRecord::Migration
  def change
    create_table :leave_masters do |t|
      t.references :leav_category, index: true, foreign_key: true
      t.string :period
      t.decimal :working_day
      t.string :no_of_leave
      t.boolean :is_carry_forward
      t.string :limit

      t.timestamps null: false
    end
  end
end
