class AddColToInvestmentDeclarations < ActiveRecord::Migration
  def change
    add_column :investment_declarations, :is_confirm, :boolean
  end
end
