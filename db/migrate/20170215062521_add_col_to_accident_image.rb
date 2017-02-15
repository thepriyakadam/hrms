class AddColToAccidentImage < ActiveRecord::Migration
  def change
    add_attachment :accident_images, :avatar
  end
end
