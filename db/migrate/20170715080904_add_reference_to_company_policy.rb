class AddReferenceToCompanyPolicy < ActiveRecord::Migration
  def change
    add_reference :company_policies, :policy_type, index: true, foreign_key: true
  end
end
