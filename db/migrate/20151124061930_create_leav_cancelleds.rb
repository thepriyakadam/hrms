class CreateLeavCancelleds < ActiveRecord::Migration
  def change
    create_table :leav_cancelleds do |t|
      t.references :employee_leav_request, index: true, foreign_key: true
      t.datetime :cancelled_date

      t.timestamps null: false
    end
  end
end
