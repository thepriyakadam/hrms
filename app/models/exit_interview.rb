class ExitInterview < ActiveRecord::Base
  belongs_to :employee
  belongs_to :question_master
  validates :question_master_id, presence: true,  uniqueness: { case_sensitive: false }
  validates :answer, presence: true,  uniqueness: { case_sensitive: false }
end
