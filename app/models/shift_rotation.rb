class ShiftRotation < ActiveRecord::Base
  belongs_to :company_shift
  belongs_to :department
  has_many :employee_shifts_shift_rotations
  has_many :employee_shifts, through: :employee_shifts_shift_rotations
  validates :company_shift_id, presence: true
  validates :department_id, presence: true
  validates :start_date, presence: true
  validates :end_date,presence: true

  def self.collect_array(sr)
  	all_emp = Employee.all.pluck(:id)
  	arr = []
  	@shift_rotations = ShiftRotation.where(start_date: sr.start_date, end_date: sr.end_date)
  	@shift_rotations.each do |sr|
  		@employee_shifts_shift_rotations = sr.employee_shifts_shift_rotations
  		@employee_shifts_shift_rotations.each do |essr|
  			arr << essr.employee_shift.employee_id
  		end
  	end
  	@employees = Employee.find(all_emp - arr)
  end
end