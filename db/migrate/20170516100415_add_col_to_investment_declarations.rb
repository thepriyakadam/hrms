class AddColToInvestmentDeclarations < ActiveRecord::Migration
  def change
    add_column :investment_declarations, :is_confirm, :boolean,  default: false
    add_column :investment_declarations, :comment, :text
  end
end
