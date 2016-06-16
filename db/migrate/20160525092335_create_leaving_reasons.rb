class CreateLeavingReasons < ActiveRecord::Migration
  def change
    create_table :leaving_reasons do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
