class FoodCoupanMaster < ActiveRecord::Base
	has_many :food_deductions

	validates :code, :presence => true
	validates :name, :presence => true
end
