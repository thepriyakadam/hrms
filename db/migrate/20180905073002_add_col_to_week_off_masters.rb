class AddColToWeekOffMasters < ActiveRecord::Migration
  def change
  	add_column :week_off_masters, :first, :boolean
  	add_column :week_off_masters, :second, :boolean
  	add_column :week_off_masters, :third, :boolean
  	add_column :week_off_masters, :forth, :boolean
  	add_column :week_off_masters, :fifth, :boolean
  end
end
