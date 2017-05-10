class AddNewColmnToCompanyTimeMasters < ActiveRecord::Migration
  def change
    add_column :company_time_masters, :time_adjust, :boolean
  end
end
