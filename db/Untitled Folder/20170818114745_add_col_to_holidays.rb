class AddColToHolidays < ActiveRecord::Migration
  def change
    add_column :holidays, :type, :string
    add_column :holidays, :c_off, :boolean
  end
end
