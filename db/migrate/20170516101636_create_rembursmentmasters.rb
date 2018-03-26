class CreateRembursmentmasters < ActiveRecord::Migration
  def change
    create_table :rembursmentmasters do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status , default: false 

      t.timestamps null: false
    end
  end
end
