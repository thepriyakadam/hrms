class AddColToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :optional_email, :string
  end
end
