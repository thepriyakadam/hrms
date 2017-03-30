class CreateBloodGroups < ActiveRecord::Migration
  def change
    create_table :blood_groups do |t|
      t.string :name
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
