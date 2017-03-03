class AddReffToSlipInformations < ActiveRecord::Migration
  def change
    add_reference :slip_informations, :employee_designation, index: true, foreign_key: true
  end
end
