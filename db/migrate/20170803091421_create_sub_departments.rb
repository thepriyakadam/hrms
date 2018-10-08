class CreateSubDepartments < ActiveRecord::Migration
  def change
    create_table :sub_departments do |t|
      t.references :department, index: true, foreign_key: true
      t.string :code
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
