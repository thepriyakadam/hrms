class CreateReportingMasters < ActiveRecord::Migration
  def change
    create_table :reporting_masters do |t|
      t.string :code
      t.string :name
      t.string :description
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
