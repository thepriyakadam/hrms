class AddRefToTraineeRequest < ActiveRecord::Migration
  def change
    add_reference :trainee_requests, :reporting_master, index: true, foreign_key: true
  end
end
