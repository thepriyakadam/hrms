class AddForeignKey < ActiveRecord::Migration
  def change
  	remove_column :companies, :company_type
  	remove_column :departments, :department_type
  	add_reference :companies, :company_type, index: true
  	add_reference :departments, :department_type, index: true
  end
end
