class CreateVacancyMasters < ActiveRecord::Migration
  def change
    create_table :vacancy_masters do |t|
      t.string :vacancy_name
      t.integer :no_of_position
      t.text :description
      t.text :justification
      t.date :vacancy_post_date
      t.string :budget
      t.references :department, index: true, foreign_key: true
      t.references :company_location, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.references :degree, index: true, foreign_key: true
      t.references :degree_1
      t.references :degree_2
      t.references :reporting_master, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.string :other_organization
      t.string :industry
      t.string :current_status
      t.boolean :is_confirmed
      t.string :vacancy_code
      t.string :experience
      t.string :keyword
      t.date :vacancy_fullfillment_date
      t.string :vacancy_type
      t.string :string     
      t.string :experince_max
      t.string :budget_max      
      t.string :reason     
      t.integer :replacement_id
      t.boolean :notice_period
      t.string :notice_period_day
      t.boolean :relocation_rerimbursement
      t.string :relocation_cost  
      t.integer :recruiter_id   
      t.date :target_date
      t.integer :company_id    
      t.string :vacancy_of     
      t.integer :sub_department_id
      t.integer :cost_center_id
      t.integer :target_company_id
      t.string :secondary_skill
      t.string :billable

      t.timestamps null: false
    end
  end
end
