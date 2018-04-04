class AddColToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :marks, :boolean
  end
end
