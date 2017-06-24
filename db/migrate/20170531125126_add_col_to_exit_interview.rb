class AddColToExitInterview < ActiveRecord::Migration
  def change
    add_reference :exit_interviews, :employee_resignation, index: true, foreign_key: true
  end
end
