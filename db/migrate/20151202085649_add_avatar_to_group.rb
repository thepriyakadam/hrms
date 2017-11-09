class AddAvatarToGroup < ActiveRecord::Migration
  def change
    add_attachment :members, :avatar
    add_attachment :groups, :avatar
  end
end
