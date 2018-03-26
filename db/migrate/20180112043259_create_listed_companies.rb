class CreateListedCompanies < ActiveRecord::Migration
  def change
    create_table :listed_companies do |t|
      t.string :name
      t.string :contact_no
      t.string :email
      t.text :location

      t.timestamps null: false
    end
  end
end
