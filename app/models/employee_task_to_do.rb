class EmployeeTaskToDo < ActiveRecord::Base
  belongs_to :employee

  def time_diff(start_time, end_time)
  seconds_diff = (start_time - end_time).to_i.abs

  hours = seconds_diff / 3600
  seconds_diff -= hours * 3600

  minutes = seconds_diff / 60
  seconds_diff -= minutes * 60

  seconds = seconds_diff

  # "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
end

def formatted_duration total_seconds
    hours = total_seconds / (60 * 60)
    minutes = (total_seconds / 60) % 60
    seconds = total_seconds % 60
    "#{ hours } h #{ minutes } m #{ seconds } s"
  end
end
