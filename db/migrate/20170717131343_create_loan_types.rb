class CreateLoanTypes < ActiveRecord::Migration
  def change
    create_table :loan_types do |t|
      t.string :code
      t.string :name
      t.text :description
      t.decimal :from
      t.decimal :to
      t.decimal :interest_rate
      t.string :interest_type
      t.boolean :status

      t.timestamps null: false
    end
  end
end
