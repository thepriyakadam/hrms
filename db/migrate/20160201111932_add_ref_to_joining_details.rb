class AddRefToJoiningDetails < ActiveRecord::Migration
  def change
    add_reference :joining_details, :department, index: true, foreign_key: true
  end
end
