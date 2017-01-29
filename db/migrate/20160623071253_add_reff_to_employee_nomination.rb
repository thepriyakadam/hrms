class AddReffToEmployeeNomination < ActiveRecord::Migration
  def change
    add_reference :employee_nominations, :illness_type, index: true, foreign_key: true
  end
end
