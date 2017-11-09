class AddAvatarToCaptureResumes < ActiveRecord::Migration
  def change
    add_attachment :capture_resumes, :avatar
  end
end
