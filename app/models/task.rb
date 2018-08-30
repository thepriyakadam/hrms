class Task < ActiveRecord::Base
	has_many :email_reminders
  validates :code, presence: true, uniqueness: { case_sensitive: false }
	validates :name, presence: true
end
