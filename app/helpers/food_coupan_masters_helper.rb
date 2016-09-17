module FoodCoupanMastersHelper
  def all_food_coupan_master
    FoodCoupanMaster.all.collect { |x| [x.name + ' Rs. ' + x.price.to_s, x.id] }
  end
end
