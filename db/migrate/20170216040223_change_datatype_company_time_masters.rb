class ChangeDatatypeCompanyTimeMasters < ActiveRecord::Migration
  def change
  	change_column :company_time_masters, :working_hrs, :string
  end
end
