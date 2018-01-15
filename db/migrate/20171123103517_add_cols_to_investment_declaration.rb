class AddColsToInvestmentDeclaration < ActiveRecord::Migration
  def change
    add_column :investment_declarations, :actual_amt, :decimal
    add_column :investment_declarations, :accepted_amt, :decimal
    add_column :investment_declarations, :rejected_amt, :decimal
  end
end
