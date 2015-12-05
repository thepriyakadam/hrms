class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :name
      t.integer :year
      t.string :duration
      t.text :descripation

      t.timestamps null: false
    end
  end
end
