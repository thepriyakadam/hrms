class CreateExperinces < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :no_of_year
      t.string :company_name
      t.string :designation
      t.string :ctc

      t.timestamps null: false
    end
  end
end
