class CreateEmployeeNominations < ActiveRecord::Migration
  def change
    create_table :employee_nominations do |t|
      t.references :nomination_master, index: true, foreign_key: true
      t.references :family, index: true, foreign_key: true
      t.decimal :nomination
      t.boolean :mental_illness
      t.boolean :minor
      t.string :guardian_name
      t.references :relation, index: true, foreign_key: true
      t.boolean :same_address
      t.text :address
      t.string :city
      t.references :district, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true
      t.integer :pin_code
      t.integer :phone_no
      t.integer :mobile_no
      t.string :email

      t.timestamps null: false
    end
  end
end
