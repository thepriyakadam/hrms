class Trainee < ActiveRecord::Base
  belongs_to :training_plan
  belongs_to :employee
end
