class CreateContactDetails < ActiveRecord::Migration
  def change
    create_table :contact_details do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
