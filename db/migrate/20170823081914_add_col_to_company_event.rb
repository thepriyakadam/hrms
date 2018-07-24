class AddColToCompanyEvent < ActiveRecord::Migration
  def change
    add_column :company_events, :email, :string
    add_column :company_events, :send_email, :boolean
  end
end
