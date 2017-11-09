class AddNewColumnToSalaryMapSaps < ActiveRecord::Migration
  def change
  	add_reference :salary_map_saps, :company, index: true, foreign_key: true
  	add_reference :salary_map_saps, :company_location, index: true, foreign_key: true
  end
end
