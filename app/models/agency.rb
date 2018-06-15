class Agency < ActiveRecord::Base
	has_many :compliance_records
	validates :code, presence: true,  uniqueness: { case_sensitive: false } 
	validates :name, presence: true,  uniqueness: { case_sensitive: false } 
end
