class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :value
      t.text :discription
      t.boolean :is_confirm
      t.boolean :status

      t.timestamps null: false
    end
  end
end
