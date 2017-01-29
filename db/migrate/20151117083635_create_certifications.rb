class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :year, index: true, foreign_key: true
      t.string :name
      t.string :duration
      t.text :description

      t.timestamps null: false
    end
  end
end
