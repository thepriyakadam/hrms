class AddPhotoToEmployees < ActiveRecord::Migration
  def change
    add_attachment :employees, :passport_photo
  end
end
