class CreateInvestmentHeads < ActiveRecord::Migration
  def change
    create_table :investment_heads do |t|
      t.references :section, index: true, foreign_key: true
      t.text :description
      t.decimal :limit
      t.string :document_name
      t.boolean :multiple_investment

      t.timestamps null: false
    end
  end
end
