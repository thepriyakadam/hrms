class CreateFirstReporters < ActiveRecord::Migration
  def change
    create_table :first_reporters do |t|

      t.timestamps null: false
    end
  end
end
