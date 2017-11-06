class AddColumnToHolidays < ActiveRecord::Migration
  def change
    remove_column :holidays, :type, :string
    add_column :holidays, :holiday_type, :string
  end
end
