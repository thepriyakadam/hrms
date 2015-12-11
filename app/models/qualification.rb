class Qualification < ActiveRecord::Base
  belongs_to :employee
  belongs_to :year
  belongs_to :degree
end
