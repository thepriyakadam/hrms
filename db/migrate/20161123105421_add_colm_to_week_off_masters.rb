class AddColmToWeekOffMasters < ActiveRecord::Migration
  def change
    add_column :week_off_masters, :from, :date
    add_column :week_off_masters, :to, :date
  end
end
