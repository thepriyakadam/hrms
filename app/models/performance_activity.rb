class PerformanceActivity < ActiveRecord::Base
	validates :name, presence: true,  uniqueness: { case_sensitive: false }
  validates :code, presence: true,  uniqueness: { case_sensitive: false }
end
