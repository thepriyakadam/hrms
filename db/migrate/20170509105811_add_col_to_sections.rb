class AddColToSections < ActiveRecord::Migration
  def change
    add_column :sections, :is_confirm, :boolean
  end
end
