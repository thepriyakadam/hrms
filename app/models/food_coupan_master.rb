class FoodCoupanMaster < ActiveRecord::Base
	has_many :food_deductions
end
