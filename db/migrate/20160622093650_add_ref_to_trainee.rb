class AddRefToTrainee < ActiveRecord::Migration
  def change
    add_reference :trainees, :employee, index: true, foreign_key: true
  end
end
