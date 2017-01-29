class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :code
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
