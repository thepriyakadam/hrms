class SubDepartment < ActiveRecord::Base
  belongs_to :department
  has_many :employees

  has_many :vacancy_masters
end
