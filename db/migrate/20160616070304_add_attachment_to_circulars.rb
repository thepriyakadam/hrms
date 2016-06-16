class AddAttachmentToCirculars < ActiveRecord::Migration
  def change
    add_attachment :circulars, :avatar
  end
end
