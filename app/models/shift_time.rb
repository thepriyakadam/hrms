class ShiftTime < ActiveRecord::Base
  has_many :shift_employees
  has_many :shift_schedules
  belongs_to :cost_center
  has_many :employee_attendances
  has_many :latemark_masters
  has_many :shift_schudule_excels

  def start_time date
  	expected_in_time = latemark_masters.order("created_at desc").first.late_limit
  	Time.parse(date.to_s + " " + expected_in_time.strftime("%H:%M"))
  end

  def start_time_to_hm
  	from.strftime("%H:%M")
  end

  def end_time_to_hm
  	to.strftime("%H:%M")
  end

  def end_time date
  	Time.parse(date.to_s + " " + to.strftime("%H:%M"))
  end

  def total_time
  	to.to_i - from.to_i
  end
end