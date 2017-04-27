class CreateFinalReporters < ActiveRecord::Migration
  def change
    create_table :final_reporters do |t|

      t.timestamps null: false
    end
  end
end
