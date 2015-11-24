class AddLeavCategoryRefToCompanyLeavs < ActiveRecord::Migration
  def change
    add_reference :company_leavs, :leav_category, index: true, foreign_key: true
  end
end
