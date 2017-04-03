class CreateRDesignations < ActiveRecord::Migration
  def change
    create_table :r_designations do |t|

      t.timestamps null: false
    end
  end
end
