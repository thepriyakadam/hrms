class AddAvatarToEmployee < ActiveRecord::Migration
  def change
  	add_attachment :employees,:employee_signature 
  end
end
