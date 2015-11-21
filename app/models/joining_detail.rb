class JoiningDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_grade

  # validates :joining_date, :presence => true
  # validates :reffernce_from, :presence => true
  # validates :admin_hr , :presence => true
  # validates :tech_hr, :presence => true
  # validates :designation, :presence => true
  # validates :ctc, :presence => true
  # # validates :account_no, :presence => true
  # # validates :employee_grade_id, :presence => true
  # validates :status, :presence => true
  # validates :probation_period, :presence => true
  # validates :notice_period, :presence => true
  # validates :medical_schem, :presence => true
end
