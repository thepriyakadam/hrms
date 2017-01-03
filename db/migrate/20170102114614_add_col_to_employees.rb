class AddColToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :punch_card_id, :string
  end
end
