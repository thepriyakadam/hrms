class CreatePunchCards < ActiveRecord::Migration
  def change
    create_table :punch_cards do |t|

      t.timestamps null: false
    end
  end
end
