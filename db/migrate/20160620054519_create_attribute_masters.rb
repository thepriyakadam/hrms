class CreateAttributeMasters < ActiveRecord::Migration
  def change
    create_table :attribute_masters do |t|
      t.string :code
      t.string :name
      t.text :definition
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
