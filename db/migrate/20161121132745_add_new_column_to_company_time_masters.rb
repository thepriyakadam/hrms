class AddNewColumnToCompanyTimeMasters < ActiveRecord::Migration
  def change
    add_column :company_time_masters, :in_time, :time
    add_column :company_time_masters, :out_time, :time
  end
end
