class CreateVisitorDetails < ActiveRecord::Migration
  def change
    create_table :visitor_details do |t|
      t.string :name
      t.string :age
      t.string :contact_no
      t.string :email_id
      t.string :id_proof
      t.string :from
      t.references :employee, index: true, foreign_key: true
      t.time :in_time
      t.time :out_time
      t.text :purpose
      t.date :visiting_date

      t.timestamps null: false
    end
  end
end
