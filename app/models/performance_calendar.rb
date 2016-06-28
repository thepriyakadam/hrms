class PerformanceCalendar < ActiveRecord::Base
  belongs_to :period
  belongs_to :performance_activity

  validates :period_id, presence: true
  validates :performance_activity_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
