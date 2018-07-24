class AddAttachmentToGreeting < ActiveRecord::Migration
  def change
    add_attachment :greetings, :birthday_image
  end
end
