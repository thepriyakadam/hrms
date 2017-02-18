class AddAttachmentToCircular < ActiveRecord::Migration
  def change
    add_attachment :circulars, :document
  end
end
