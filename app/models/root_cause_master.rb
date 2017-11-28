class RootCauseMaster < ActiveRecord::Base
  
  has_many :accident_records
 validates :name, presence: true, uniqueness: { case_sensitive: false }
 validates :code, presence: true, uniqueness: { case_sensitive: false }
end
