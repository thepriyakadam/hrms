class RetentionMoney < ActiveRecord::Base
	validates :amount, :presence => true,  uniqueness: { case_sensitive: false }
end
