class ReimbursementSlab < ActiveRecord::Base
  belongs_to :reimbursement_head
  belongs_to :employee_grade
  belongs_to :employee_designation
	validates :reimbursement_head_id, presence: true
	validates :employee_grade_id, presence: true
	validates :employee_designation_id, presence: true
	validates :from, presence: true
	validates :to, presence: true
end
