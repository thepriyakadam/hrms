class AddColToListedCompanies < ActiveRecord::Migration
  def change
    add_column :listed_companies, :status, :boolean
  end
end
