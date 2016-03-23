class AttributeRatingSheet < ActiveRecord::Base
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :employee_attribute

end
