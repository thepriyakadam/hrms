class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :ssc
      t.string :ssc_from
      t.string :ssc_marks
      t.integer :ssc_year
      t.string :ssc_bord
      t.string :deploma
      t.string :deploma_from
      t.string :deploma_marks
      t.integer :deploma_year
      t.string :deploma_university
      t.string :hsc
      t.string :hsc_from
      t.string :hsc_marks
      t.integer :hsc_year
      t.string :hsc_bord
      t.string :ug
      t.string :ug_from
      t.string :ug_marks
      t.integer :ug_year
      t.string :ug_university
      t.string :pg
      t.string :pg_from
      t.string :pg_marks
      t.integer :pg_yaer
      t.string :pg_university

      t.timestamps null: false
    end
  end
end
