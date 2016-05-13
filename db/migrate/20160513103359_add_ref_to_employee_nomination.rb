class AddRefToEmployeeNomination < ActiveRecord::Migration
  def change
  	add_reference :employee_nominations, :country, index: true, foreign_key: true
    remove_column :employee_nominations, :contry_id
  end
end
