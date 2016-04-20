class AttributeRatingSheet < ActiveRecord::Base
  belongs_to :appraisee, class_name: "Employee"
  belongs_to :appraiser, class_name: "Employee"
  belongs_to :employee_attribute
  belongs_to :attribute_master

  belongs_to :final_id, class_name: "Employee"
  belongs_to :appraiser2, class_name: "Employee"
end
