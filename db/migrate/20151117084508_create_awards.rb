class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :award_name
      t.string :award_from
      t.text :description
      t.references :year, index: true, foreign_key: true
      

      t.timestamps null: false
    end
  end
end