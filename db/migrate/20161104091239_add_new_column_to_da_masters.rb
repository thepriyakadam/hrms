class AddNewColumnToDaMasters < ActiveRecord::Migration
  def change
    add_column :da_masters, :base_component, :string
  end
end
