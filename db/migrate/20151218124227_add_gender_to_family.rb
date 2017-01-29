class AddGenderToFamily < ActiveRecord::Migration
  def change
    add_column :families, :gender, :string
  end
end
