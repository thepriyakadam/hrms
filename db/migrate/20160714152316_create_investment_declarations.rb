class CreateInvestmentDeclarations < ActiveRecord::Migration
  def change
    create_table :investment_declarations do |t|
      t.date :date
      t.references :investment_head, index: true, foreign_key: true
      t.decimal :amount
      t.references :employee, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
