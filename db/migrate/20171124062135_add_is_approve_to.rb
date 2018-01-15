class AddIsApproveTo < ActiveRecord::Migration
  def change
  	add_column :investment_declarations, :is_approve, :boolean
  end
end
