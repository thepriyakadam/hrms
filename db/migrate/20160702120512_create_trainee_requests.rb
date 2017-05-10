class CreateTraineeRequests < ActiveRecord::Migration
  def change
    create_table :trainee_requests do |t|
      t.references :training_request, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
