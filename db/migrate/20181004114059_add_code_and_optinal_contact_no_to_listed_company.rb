class AddCodeAndOptinalContactNoToListedCompany < ActiveRecord::Migration
  def change
    add_column :listed_companies, :code, :string
    add_column :listed_companies, :optinal_contact_no, :string
  end
end
