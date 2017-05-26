class CreateInductionDetails < ActiveRecord::Migration
  def change
    create_table :induction_details do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :start_date
      t.references :induction_master, index: true, foreign_key: true
      t.boolean :induction_completed

      t.timestamps null: false
    end
  end
end
