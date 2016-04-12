class AddcolumnToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :isweekend, :boolean
  end
end
