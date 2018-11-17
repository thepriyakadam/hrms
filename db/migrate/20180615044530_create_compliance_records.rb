class CreateComplianceRecords < ActiveRecord::Migration
  def change
    create_table :compliance_records do |t|
      t.references :compliance_type, index: true, foreign_key: true
      t.references :agency, index: true, foreign_key: true
      t.date :compliance_date
      t.string :amount
      t.text :comment
      t.boolean :status

      t.timestamps null: false
    end
  end
end