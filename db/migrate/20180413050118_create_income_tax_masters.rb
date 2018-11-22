class CreateIncomeTaxMasters < ActiveRecord::Migration
  def change
    create_table :income_tax_masters do |t|
      t.text :name
      t.string :relation
      t.text :second_name
      t.string :designation
      t.boolean :status

      t.timestamps null: false
    end
  end
end
