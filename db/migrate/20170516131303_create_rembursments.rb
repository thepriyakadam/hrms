class CreateRembursments < ActiveRecord::Migration
  def change
    create_table :rembursments do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :manager
      t.date :application_date
      t.date :rembursment_date
      t.references :rembursmentmaster, index: true, foreign_key: true
      t.decimal :amount , precision: 5, scale: 1
      t.date :paid_date
      t.boolean :status

      t.timestamps null: false
    end
  end
end
