class CreateLeavRequests < ActiveRecord::Migration
  def change
    create_table :leav_requests do |t|
      t.references :leav_type, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.string :available_leaves
      t.string :leave
      t.datetime :date_from
      t.datetime :date_to
      t.string :no_of_days
      t.text :reason
      t.date :applied_on

      t.timestamps null: false
    end
  end
end
