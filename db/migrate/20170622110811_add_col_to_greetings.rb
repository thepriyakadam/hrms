class AddColToGreetings < ActiveRecord::Migration
  def change
  	remove_column :greetings, :type, :string
    add_column :greetings, :greeting_type, :string
  end
end
