class AddColToSectios < ActiveRecord::Migration
  def change
    add_column :sections, :limit, :decimal
  end
end
