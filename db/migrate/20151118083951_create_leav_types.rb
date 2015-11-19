class CreateLeavTypes < ActiveRecord::Migration
  def change
    create_table :leav_types do |t|
      t.string :leave_type
      t.string :no_of_leave
      t.datetime :leave_expiry_date

      t.timestamps null: false
    end
  end
end
