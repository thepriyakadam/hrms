class PerformanceCalendar < ActiveRecord::Base
  belongs_to :period
  belongs_to :performance_activity
end
