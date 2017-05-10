class Addcoloumntoleavcategoryforpayble < ActiveRecord::Migration
  def change
  	add_column :leav_categories, :is_payble, :boolean
  end
end
