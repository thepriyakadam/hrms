class AddColToInstalments < ActiveRecord::Migration
  def change
    add_column :instalments, :is_complete, :boolean, default: false
  end
end
