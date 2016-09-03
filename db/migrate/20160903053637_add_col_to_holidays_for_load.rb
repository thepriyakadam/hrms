class AddColToHolidays < ActiveRecord::Migration
  def change
    add_column :holidays, :is_loaded, :boolean, default: false
  end
end
