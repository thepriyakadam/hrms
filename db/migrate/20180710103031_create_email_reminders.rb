class CreateEmailReminders < ActiveRecord::Migration
  def change
    create_table :email_reminders do |t|
      t.references :task, index: true, foreign_key: true
      t.string :frequency
      t.date :task_date
      t.string :reminder_from
      t.string :reminder_to
      t.string :email_to
      t.string :email_cc
      t.string :email_bcc
      t.text :email_text
      t.boolean :status

      t.timestamps null: false
    end
  end
end
