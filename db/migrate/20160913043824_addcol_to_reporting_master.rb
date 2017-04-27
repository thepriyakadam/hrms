class AddcolToReportingMaster < ActiveRecord::Migration
  def change
  add_column :reporting_masters, :is_training, :boolean
  add_column :reporting_masters, :is_recruitment, :boolean
  add_column :reporting_masters, :is_resignation, :boolean
  add_column :reporting_masters, :is_transfer , :boolean
  add_column :reporting_masters, :is_promotion, :boolean
  add_column :reporting_masters, :is_active, :boolean
  end
end
