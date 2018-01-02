class AddColToCompanyEvent < ActiveRecord::Migration
  def change
    add_column :company_events, :email, :string
  end
end
