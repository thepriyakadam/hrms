class AttributeRatingSheet < ActiveRecord::Base
  belongs_to :appraisee, class_name: "Employee"
  belongs_to :appraiser, class_name: "Employee"
  belongs_to :employee_attribute
  belongs_to :attribute_master
end
