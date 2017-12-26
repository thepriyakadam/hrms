class CreateSidebarTabs < ActiveRecord::Migration
  def change
    create_table :sidebar_tabs do |t|
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
