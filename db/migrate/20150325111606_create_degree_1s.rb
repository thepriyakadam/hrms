class CreateDegree1s < ActiveRecord::Migration
  def change
    create_table :degree_1s do |t|

      t.timestamps null: false
    end
  end
end
