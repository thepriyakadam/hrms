class AddColmnToWeekOffMasters < ActiveRecord::Migration
  def change
    add_column :week_off_masters, :is_prefix, :boolean
  end
end
