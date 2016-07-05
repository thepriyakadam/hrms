class CreateSettingMasters < ActiveRecord::Migration
  def change
    create_table :setting_masters do |t|
      t.string :date
      t.string :precision
      t.string :timeformat
      t.string :email

      t.timestamps null: false
    end
  end
end
