class CreateCandidateForms < ActiveRecord::Migration
  def change
    create_table :candidate_forms do |t|
      t.references :vacancy_request, index: true, foreign_key: true
      t.string :name
      t.references :qualification, index: true, foreign_key: true
      t.string :skill_set
      t.integer :contact_no
      t.string :email
      t.string :candidate_type
      t.string :experience
      t.string :notice_period
      t.references :selected_by

      t.timestamps null: false
    end
  end
end
