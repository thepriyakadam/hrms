class CreateDegreeStreams < ActiveRecord::Migration
  def change
    create_table :degree_streams do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
