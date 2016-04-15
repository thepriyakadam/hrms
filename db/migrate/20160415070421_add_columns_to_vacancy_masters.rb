class AddColumnsToVacancyMasters < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :other_organization, :string
    add_column :vacancy_masters, :industry, :string
    add_attachment :capture_resumes, :passport_photo
    add_column :capture_resumes, :contact_no2, :string
    add_column :capture_resumes, :email2, :string
    add_column :capture_resumes, :linkedin, :string
    add_reference :capture_resumes, :vacancy_master, index: true, foreign_key: true
    add_reference :capture_resumes, :degree, index: true, foreign_key: true
  end
end