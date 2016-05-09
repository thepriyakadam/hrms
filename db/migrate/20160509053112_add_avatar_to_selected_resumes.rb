class AddAvatarToSelectedResumes < ActiveRecord::Migration
  def change 
    add_attachment :selected_resumes, :avatar
    add_attachment :selected_resumes, :passport_photo
  end
end
