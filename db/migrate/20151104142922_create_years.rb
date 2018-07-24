class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :name
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
