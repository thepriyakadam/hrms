class ChangeColumnToCompanyShift < ActiveRecord::Migration
  def change
  	change_column :company_shifts, :in_time, :datetime
    change_column :company_shifts, :out_time, :datetime
  end
end
