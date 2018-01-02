class AddColToCircular < ActiveRecord::Migration
  def change
    add_column :circulars, :email, :string
  end
end
