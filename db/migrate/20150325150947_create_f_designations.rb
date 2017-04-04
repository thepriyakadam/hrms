class CreateFDesignations < ActiveRecord::Migration
  def change
    create_table :f_designations do |t|

      t.timestamps null: false
    end
  end
end
