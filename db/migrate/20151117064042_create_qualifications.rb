class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :degree, index: true, foreign_key: true
      t.references :degree_type, index: true, foreign_key: true
      t.references :degree_stream, index: true, foreign_key: true
      t.references :year, index: true, foreign_key: true
      t.references :university, index: true, foreign_key: true
      t.string :college
      t.string :marks_type
      t.string :marks

      t.timestamps null: false
    end
  end
end
