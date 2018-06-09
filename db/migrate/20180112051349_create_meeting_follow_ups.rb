class CreateMeetingFollowUps < ActiveRecord::Migration
  def change
    create_table :meeting_follow_ups do |t|
      t.references :employee_plan, index: true, foreign_key: true
      t.string :contact_person
      t.string :contact_no
      t.text :follow_up_response
      t.date :date
      t.time :time
      t.date :next_date
      t.time :next_time

      t.timestamps null: false
    end
  end
end
