class AddColumnToJoiningDetails < ActiveRecord::Migration
  def change
  	add_column :joining_details, :gps_track, :boolean
    add_column :joining_details, :restricted_area, :boolean
  	add_column :joining_details, :contract_month, :string
    add_column :joining_details, :contract_end_date, :date
    add_column :joining_details, :c_off_applicable_day, :decimal, default: 0
    add_column :joining_details, :c_off_expire, :boolean
<<<<<<< HEAD
     add_column :joining_details, :contract_month, :string
    add_column :joining_details, :contract_end_date, :date
=======
     add_column :joining_details, :welfare, :boolean
    add_column :joining_details, :contact_library, :boolean
>>>>>>> dbda16c7f4efa6c63f220e172959c373e96b0b78
  end
end
