class AddStartDateToSocietyMemberShip < ActiveRecord::Migration
  def change
    add_column :society_member_ships, :start_date, :date
  end
end
