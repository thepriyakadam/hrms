class RemoveColumnFromCaptureResumes < ActiveRecord::Migration
  def change
    remove_column :capture_resumes, :country, :string
    remove_column :capture_resumes, :state, :string
    remove_column :capture_resumes, :district, :string
    add_reference :capture_resumes, :country, index: true, foreign_key: true
    add_reference :capture_resumes, :state, index: true, foreign_key: true
    add_reference :capture_resumes, :district, index: true, foreign_key: true
  end
end
