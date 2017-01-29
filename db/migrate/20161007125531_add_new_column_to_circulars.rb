class AddNewColumnToCirculars < ActiveRecord::Migration
  def change
    add_column :circulars, :is_active, :boolean
    add_column :circulars, :is_confirm, :boolean
  end
end
