class AddColToSidebarTab < ActiveRecord::Migration
  def change
    add_column :sidebar_tabs, :tab_name, :string
  end
end
