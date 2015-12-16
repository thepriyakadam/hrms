class CreateDegreeTypes < ActiveRecord::Migration
  def change
    create_table :degree_types do |t|
      t.string :code
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end