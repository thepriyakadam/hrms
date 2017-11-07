class ExitInterview < ActiveRecord::Base
  belongs_to :employee
  belongs_to :question_master
  has_many :employee_resignations
  validates :question_master_id, presence: true 
  validates_uniqueness_of :question_master_id, :scope => :employee_id
  # validates :answer, presence: true 

end
