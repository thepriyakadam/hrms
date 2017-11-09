class AddRefToDueDetails < ActiveRecord::Migration
  def change
    add_reference :due_details, :due_template, index: true, foreign_key: true
  end
end
