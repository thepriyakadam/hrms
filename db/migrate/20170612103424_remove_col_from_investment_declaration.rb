class RemoveColFromInvestmentDeclaration < ActiveRecord::Migration
  def change
    remove_attachment :investment_declarations,:string
  end
end
