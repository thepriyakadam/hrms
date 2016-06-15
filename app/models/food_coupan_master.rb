class FoodCoupanMaster < ActiveRecord::Base
  has_many :food_deductions

  validates :code, presence: true , uniqueness:{case_sensitive:false}
  validates :name, presence: true
end
