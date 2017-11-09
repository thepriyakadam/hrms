class CreateManager2s < ActiveRecord::Migration
  def change
    create_table :manager_2s do |t|

      t.timestamps null: false
    end
  end
end
