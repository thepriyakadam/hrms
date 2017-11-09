class CreateSelectedResumes < ActiveRecord::Migration
  def change
    create_table :selected_resumes do |t|
      t.string :name
      t.string :contact_no
      t.text :skillset
      t.references :degree, index: true, foreign_key: true
      t.decimal :ctc
      t.string :email_id
      t.string :experience
      t.string :notice_period
      t.references :vacancy_master, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
