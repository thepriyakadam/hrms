class CreateAttributeMasters < ActiveRecord::Migration
  def change
    create_table :attribute_masters do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
