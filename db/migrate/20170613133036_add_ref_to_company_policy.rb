class AddRefToCompanyPolicy < ActiveRecord::Migration
  def change
    add_reference :company_policies, :policy_type, index: true, foreign_key: true
    remove_column :company_policies, :policy_type
  end
end
