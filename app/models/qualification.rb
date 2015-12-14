class Qualification < ActiveRecord::Base
  belongs_to :employee
  belongs_to :year
  belongs_to :degree
  belongs_to :degree_type
  belongs_to :degree_stream

  validates :college, :presence => true
  validates :marks, :presence => true
  validates :university, :presence => true
  validates :year_id, :presence => true
  validates :degree_id, :presence => true
  validates :degree_type_id, :presence => true
  validates :degree_stream_id, :presence => true
end
