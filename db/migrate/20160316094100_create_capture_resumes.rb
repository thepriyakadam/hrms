class CreateCaptureResumes < ActiveRecord::Migration
  def change
    create_table :capture_resumes do |t|
      t.string :name_of_candidate
      t.string :contact_no
      t.string :post_applied
      t.string :mode_of_application
      t.date :date_of_application
      t.string :url
      t.string :fax
      t.text :street
      t.string :country
      t.string :state
      t.string :district
      t.string :city
      t.string :zip_code
      t.string :current_job_title
      t.string :current_employeer
      t.string :skill_set
      t.string :additional_info
      t.string :email
      t.string :skype_id
      t.string :twitter
      t.decimal :current_salary
      t.decimal :expected_salary
      t.string :current_location
      t.string :notice_period
      t.date :interview_date
      t.time :interview_time
      t.string :reason
      t.string :work_experience
      t.string :candidate_call_status

      t.timestamps null: false
    end
  end
end
