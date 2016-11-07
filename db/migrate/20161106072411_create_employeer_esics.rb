class CreateEmployeerEsics < ActiveRecord::Migration
  def change
    create_table :employeer_esics do |t|
      t.references :empoyee, index: true, foreign_key: true
      t.date :esic_date
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
