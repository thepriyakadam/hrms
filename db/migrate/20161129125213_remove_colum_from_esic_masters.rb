class RemoveColumFromEsicMasters < ActiveRecord::Migration
  def change
  	change_column :esic_masters, :is_active, :boolean
    remove_column :esic_masters, :boolean, :string
  end
end
