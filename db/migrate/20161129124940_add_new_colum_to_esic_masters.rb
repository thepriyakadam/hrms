class AddNewColumToEsicMasters < ActiveRecord::Migration
  def change
    add_column :esic_masters, :is_active, :string
    add_column :esic_masters, :boolean, :string
  end
end
