class AddRefToComapyPolicy < ActiveRecord::Migration
  def change
    add_reference :comapy_policies, :policy_type, index: true, foreign_key: true
  end
end
