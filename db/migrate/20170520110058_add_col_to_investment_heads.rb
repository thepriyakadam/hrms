class AddColToInvestmentHeads < ActiveRecord::Migration
  def change
    add_column :investment_heads, :document_name, :string
  end
end
