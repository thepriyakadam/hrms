class CreateTrainingApprovals < ActiveRecord::Migration
  def change
    create_table :training_approvals do |t|
      t.references :training_request, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :training_topic_master, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.string :traininig_period
      t.date :training_date
      t.string :place
      t.string :no_of_employee
      t.text :description
      t.text :justification
      t.timestamps null: false
    end
  end
end
