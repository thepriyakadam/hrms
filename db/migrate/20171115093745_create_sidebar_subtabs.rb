class CreateSidebarSubtabs < ActiveRecord::Migration
  def change
    create_table :sidebar_subtabs do |t|
      t.string :subtabname
      t.boolean :status

      t.timestamps null: false
    end
  end
end
