class FoodDeduction < ActiveRecord::Base
  belongs_to :employee
  belongs_to :food_coupan_master

  validates :employee_id, presence: true
  validates :food_date, presence: true
  validates :no_of_coupan, presence: true
  validates :food_coupan_master_id, presence: true
end
