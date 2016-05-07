class EmployeeNomination < ActiveRecord::Base
  belongs_to :nominational_master
  belongs_to :family
  belongs_to :relation
  belongs_to :district
  belongs_to :state
  belongs_to :contry
end
