class RemoveDocumentFromInvestmentDeclaration < ActiveRecord::Migration
  def change
    remove_attachment :investment_declarations, :document
end
end
