class AddRefCompanyLocationToJoiningDetail < ActiveRecord::Migration
  def change
    add_reference :joining_details, :company_location, index: true, foreign_key: true
  end
end
