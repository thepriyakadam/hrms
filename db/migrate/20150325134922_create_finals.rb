class CreateFinals < ActiveRecord::Migration
  def change
    create_table :finals do |t|

      t.timestamps null: false
    end
  end
end
