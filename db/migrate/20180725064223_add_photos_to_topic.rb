class AddPhotosToTopic < ActiveRecord::Migration
  def change
  	add_attachment :topics, :avatar
  end
end
