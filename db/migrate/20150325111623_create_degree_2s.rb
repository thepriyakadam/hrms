class CreateDegree2s < ActiveRecord::Migration
  def change
    create_table :degree_2s do |t|

      t.timestamps null: false
    end
  end
end
