class CreateLeavAproveds < ActiveRecord::Migration
  def change
    create_table :leav_approveds do |t|
      t.references :employee_leav_request, index: true, foreign_key: true
      t.datetime :approved_date

      t.timestamps null: false
    end
 end
end
