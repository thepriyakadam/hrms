class AddReferenceToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :cost_center, index: true, foreign_key: true
  end
end
