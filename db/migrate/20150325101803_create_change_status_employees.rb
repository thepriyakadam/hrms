class CreateChangeStatusEmployees < ActiveRecord::Migration
  def change
    create_table :change_status_employees do |t|

      t.timestamps null: false
    end
  end
end
