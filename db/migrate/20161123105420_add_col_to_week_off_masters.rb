class AddColToWeekOffMasters < ActiveRecord::Migration
  def change
    add_column :week_off_masters, :is_send, :boolean
  end
end
