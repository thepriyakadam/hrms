class CreateSlipInformations < ActiveRecord::Migration
  def change
    create_table :slip_informations do |t|
      t.references :salaryslip, index: true, foreign_key: true
      t.references :cost_center, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.string :contact_no
      t.string :esic_no
      t.string :pf_no
      t.string :uan_no
      t.decimal :cl
      t.decimal :el
      t.decimal :c_off
      t.decimal :advance
      t.string :account_no

      t.timestamps null: false
    end
  end
end
