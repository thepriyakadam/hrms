class AddColToGreeting < ActiveRecord::Migration
  def change
    add_column :greetings, :greeting_type, :string
  end
end
