class AddColumnsToVacancyMasters < ActiveRecord::Migration
  def change
    add_attachment :capture_resumes, :passport_photo
  end
end