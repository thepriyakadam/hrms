class ExitInterview < ActiveRecord::Base
  belongs_to :employee
  belongs_to :question_master
end
