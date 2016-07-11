class CompanyPolicy < ActiveRecord::Base
	validates :name,presence:true
end
