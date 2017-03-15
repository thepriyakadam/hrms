class TrainingRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
  belongs_to :training_topic_master
  has_many :training_plans
  has_many :reporting_masters, :through =>:reporting_masters_training_reqs 

  def is_there?
    flag = 0
    flag1 = 0
    flag2 = 0
    flag3 = 0
      flag = TrainingRequest.exists?(employee_id: self.employee_id,training_topic_master_id: self.training_topic_master_id,status: 'Pending') ||
      flag1 = TrainingRequest.exists?(employee_id: self.employee_id,training_topic_master_id: self.training_topic_master_id,status: 'FirstApproved') ||
      flag2 = TrainingRequest.exists?(employee_id: self.employee_id,training_topic_master_id: self.training_topic_master_id,status: 'SecondApproved') ||
      flag3 = TrainingRequest.exists?(employee_id: self.employee_id,training_topic_master_id: self.training_topic_master_id,status: 'FinalApproved')
    flag
    flag1
    flag2
    flag3
  end
end
