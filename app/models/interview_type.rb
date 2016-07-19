class InterviewType < ActiveRecord::Base

   validates :code, presence: true,  uniqueness: { case_sensitive: false }
   validates :name, presence: true,  uniqueness: { case_sensitive: false }
   
   has_many :interview_rounds
   has_many :interview_round_reschedules
end
