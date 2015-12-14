class Qualification < ActiveRecord::Base
  belongs_to :employee
  belongs_to :year
  belongs_to :degree
  belongs_to :degree_type
  belongs_to :degree_stream
end
