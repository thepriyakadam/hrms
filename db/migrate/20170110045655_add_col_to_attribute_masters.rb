class AddColToAttributeMasters < ActiveRecord::Migration
  def change
    add_reference :attribute_masters, :department, index: true, foreign_key: true
  end
end
