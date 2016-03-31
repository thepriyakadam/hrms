class RemoveAppraiseeFromEmployeeAttributes < ActiveRecord::Migration
  def change
  	 remove_column :employee_attributes, :appraisee_comment, :text
     remove_column :employee_attributes, :appraisee_rating, :integer
     remove_column :employee_attributes, :appraiser_comment, :text
     remove_column :employee_attributes, :appraiser_rating, :integer
  end
end
