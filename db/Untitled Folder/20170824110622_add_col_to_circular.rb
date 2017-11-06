class AddColToCircular < ActiveRecord::Migration
  def change
    add_column :circulars, :email, :string
    add_column :circulars, :send_email, :boolean
  end
end
