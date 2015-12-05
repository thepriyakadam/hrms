class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :course
      t.string :college
      t.string :marks
      t.integer :passout_year
      t.string :university
      

      t.timestamps null: false
    end
  end
end
