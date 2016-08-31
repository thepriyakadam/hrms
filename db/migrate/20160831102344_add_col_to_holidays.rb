class AddColToHolidays < ActiveRecord::Migration
  def change
  	add_column :holidays, :is_taken, :boolean
  	remove_column :holidays, :isweekend, :boolean
  end
end
