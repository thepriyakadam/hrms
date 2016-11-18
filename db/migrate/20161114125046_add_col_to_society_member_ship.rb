class AddColToSocietyMemberShip < ActiveRecord::Migration
  def change
    add_column :society_member_ships, :is_active, :boolean
    add_column :society_member_ships, :is_confirm, :boolean
  end
end
