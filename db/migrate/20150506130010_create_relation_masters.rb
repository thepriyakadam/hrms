class CreateRelationMasters < ActiveRecord::Migration
  def change
    create_table :relation_masters do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
