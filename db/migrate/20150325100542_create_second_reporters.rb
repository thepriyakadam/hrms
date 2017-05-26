class CreateSecondReporters < ActiveRecord::Migration
  def change
    create_table :second_reporters do |t|

      t.timestamps null: false
    end
  end
end
