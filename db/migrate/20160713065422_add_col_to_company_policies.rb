class AddColToCompanyPolicies < ActiveRecord::Migration
  def change
    add_column :company_policies, :description, :text
  end
end
