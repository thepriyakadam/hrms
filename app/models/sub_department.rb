class SubDepartment < ActiveRecord::Base
  belongs_to :department

  has_many :vacancy_masters
end
