class CreateParticularOdRecords < ActiveRecord::Migration
  def change
    create_table :particular_od_records do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :on_duty_request, index: true, foreign_key: true
      t.datetime :leave_date
      t.boolean :is_full
      t.boolean :is_cancel_after_approve

      t.timestamps null: false
    end
  end
end
