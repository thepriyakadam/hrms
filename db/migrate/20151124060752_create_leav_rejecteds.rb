class CreateLeavRejecteds < ActiveRecord::Migration
  def change
    create_table :leav_rejecteds do |t|
      t.references :employee_leav_request, index: true, foreign_key: true
      t.datetime :rejected_date

      t.timestamps null: false
    end
  end
end
