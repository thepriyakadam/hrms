class CreateVacancyMasters < ActiveRecord::Migration
  def change
    create_table :vacancy_masters do |t|
      t.string :job_title
      t.string :vacancy_name
      t.string :educational_qualification
      t.integer :no_of_position
      t.text :description
      t.date :vacancy_post_date
      t.string :department_name
      t.string :budget

      t.timestamps null: false
    end
  end
end
