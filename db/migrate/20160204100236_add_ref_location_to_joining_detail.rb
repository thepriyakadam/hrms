class AddRefLocationToJoiningDetail < ActiveRecord::Migration
  def change
    add_reference :joining_details, :location, index: true, foreign_key: true
  end
end
