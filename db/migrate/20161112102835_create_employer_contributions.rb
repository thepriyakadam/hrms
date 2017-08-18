class CreateEmployerContributions < ActiveRecord::Migration
  def change
    create_table :employer_contributions do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :date
      t.decimal :actual_pf
      t.decimal :pf
      t.decimal :actual_esic
      t.decimal :esic
      t.decimal :actual_fp
      t.decimal :fp
      t.decimal :actual_insurance
      t.decimal :insurance
      t.decimal :actual_bonus
      t.decimal :bonus

      t.timestamps null: false
    end
  end
end
