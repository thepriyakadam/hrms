class CreateStatusCOffs < ActiveRecord::Migration
  def change
    create_table :status_c_offs do |t|
      t.references :leave_c_off, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
