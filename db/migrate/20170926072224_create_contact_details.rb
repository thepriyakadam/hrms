class CreateContactDetails < ActiveRecord::Migration
  def change
    create_table :contact_details do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :status
      t.string   :role1
      t.string   :role2
      t.string   :role3
      t.string   :role4
      t.string   :role5
      t.string   :role6
      t.string   :role7
      t.string   :role8

      t.timestamps null: false
    end
  end
end
