class AddColToCompanyPolicy < ActiveRecord::Migration
  def change
    add_column :company_policies, :policy_type, :string
  end
end
