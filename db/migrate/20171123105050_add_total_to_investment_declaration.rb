class AddTotalToInvestmentDeclaration < ActiveRecord::Migration
  def change
    add_column :investment_declarations, :total_amt, :decimal
  end
end
