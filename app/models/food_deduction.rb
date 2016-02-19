class FoodDeduction < ActiveRecord::Base
  belongs_to :employee
  belongs_to :food_coupan_master
end
