class CreateLeavCategories < ActiveRecord::Migration
  def change
    create_table :leav_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
