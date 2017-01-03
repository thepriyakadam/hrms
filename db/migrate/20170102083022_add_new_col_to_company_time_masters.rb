class AddNewColToCompanyTimeMasters < ActiveRecord::Migration
  def change
    add_column :company_time_masters, :rest_time, :string
  end
end
