class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :no_of_member
      t.string :f_name
      t.string :m_name
      t.string :l_name
      t.date :date_of_birth
      t.integer :age
      t.string :contact_no
      t.string :email
      t.text :current_address
      t.string :relation
      t.string :adhar_no
      t.string :pan_no
      t.string :have_passport
      t.string :passport_no
      t.date :passport_issue_date
      t.date :passport_expiry_date
      t.string :medical_claim
      t.string :marital
      t.string :blood_group
      t.string :religion
      t.string :is_handicap
      t.string :handicap_type
      t.string :profession

      t.timestamps null: false
    end
  end
end
