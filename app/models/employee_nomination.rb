class EmployeeNomination < ActiveRecord::Base
  belongs_to :nomination_master
  belongs_to :family
  belongs_to :relation
  belongs_to :district
  belongs_to :state
  belongs_to :country
  belongs_to :employee
end
