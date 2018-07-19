class AttendanceRegularization < ActiveRecord::Base
	belongs_to :employee
  	belongs_to :regularization_reason

  	validates :date, presence: true
  	validates :regularization_reason_id, presence: true
  	validates :justification, presence: true
end
