class EmployeeAttribute < ActiveRecord::Base
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :attribute_master
  belongs_to :definition
end
