class ChangeColumnCompanyTimeMasters < ActiveRecord::Migration
  def change
  	change_column :company_time_masters, :in_min_time, :datetime
  end
end
