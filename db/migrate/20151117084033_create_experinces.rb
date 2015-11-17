class CreateExperinces < ActiveRecord::Migration
  def change
    create_table :experinces do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :no_of_year_experince
      t.string :company_name
      t.string :designation
      t.string :ctc

      t.timestamps null: false
    end
  end
end
