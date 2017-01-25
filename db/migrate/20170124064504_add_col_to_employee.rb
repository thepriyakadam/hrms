class AddColToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :prefix, :string
  end
end
