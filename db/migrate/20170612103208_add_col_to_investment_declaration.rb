class AddColToInvestmentDeclaration < ActiveRecord::Migration
  def change
    add_attachment :investment_declarations, :document, :string
  end
end
