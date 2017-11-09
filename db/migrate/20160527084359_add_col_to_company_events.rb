class AddColToCompanyEvents < ActiveRecord::Migration
  def change
    add_column :company_events, :description, :text
  end
end
