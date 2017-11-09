class ChangeCompanyShiftTypeInTimeOutTime < ActiveRecord::Migration
  def change
    change_column :company_shifts, :in_time, :time
    change_column :company_shifts, :out_time, :time
  end
end
