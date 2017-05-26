class CreateEmployeeNominations < ActiveRecord::Migration
  def change
    create_table :employee_nominations do |t|
      t.references :nomination_master, index: true, foreign_key: true
      t.references :family, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :relation_master, index: true, foreign_key: true
      t.decimal :nomination
      t.boolean :mental_illness
      t.boolean :minor
      t.string :guardian_name
      t.boolean :same_address
      t.text :address
      t.string :city
      t.references :district, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true
      t.integer :pin_code
      t.string :email
      t.references :illness_type, index: true, foreign_key: true

      t.string :mobile_no
      t.string :phone_no

      t.timestamps null: false
    end
  end
end
