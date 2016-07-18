class AddNewColumnToCompanyPolicies < ActiveRecord::Migration
  def change
  	 remove_column :company_policies, :document, :string
  	add_attachment :company_policies, :document
  end
end
