class AddLocationToMember < ActiveRecord::Migration
  def change
    add_column :members, :location, :string
  end
end
