class CreateGreetings < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.date :date
      t.string :greeting_type
      t.references :sender
      t.references :receiver
      t.text :message
      t.boolean :status

      t.timestamps null: false
    end
  end
end
