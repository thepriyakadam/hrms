class CreateReservedCategories < ActiveRecord::Migration
  def change
    create_table :reserved_categories do |t|
      t.string :code
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
