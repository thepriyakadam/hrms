class ChangeColmnCompanyTimeMasters < ActiveRecord::Migration
  def change
  	change_column :company_time_masters, :in_max_time, :datetime
  	change_column :company_time_masters, :in_time, :datetime
  	change_column :company_time_masters, :out_min_time, :datetime
  	change_column :company_time_masters, :out_max_time, :datetime
  	change_column :company_time_masters, :out_time, :datetime
  end
end
