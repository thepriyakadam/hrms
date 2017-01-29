class AddDocumentToInvestmentDeclaration < ActiveRecord::Migration
  def change
    add_attachment :investment_declarations, :document
  end
end
