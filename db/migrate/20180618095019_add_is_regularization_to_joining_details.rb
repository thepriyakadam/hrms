class AddIsRegularizationToJoiningDetails < ActiveRecord::Migration
  def change
  	add_column :joining_details, :is_regularization, :boolean
  end
end
