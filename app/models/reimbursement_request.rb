class ReimbursementRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reimbursement_head
  belongs_to :approval, class_name: 'Employee'
end
