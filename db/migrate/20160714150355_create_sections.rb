class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :code
      t.text :description
      t.boolean :status
      t.boolean :is_confirm
      t.decimal :limit

      t.timestamps null: false
    end
  end
end
