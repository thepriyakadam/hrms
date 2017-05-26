class AddAvatarToVisitorDetail < ActiveRecord::Migration
  def change
    add_attachment :visitor_details, :avatar
  end
end
