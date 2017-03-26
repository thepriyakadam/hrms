class CreateReligions < ActiveRecord::Migration
  def change
    create_table :religions do |t|
      t.string :name
      t.string :code
      t.string :description

      t.timestamps null: false
    end
  end
end
