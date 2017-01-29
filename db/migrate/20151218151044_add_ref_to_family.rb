class AddRefToFamily < ActiveRecord::Migration
  def change
    add_reference :families, :blood_group, index: true, foreign_key: true
    remove_column :families, :blood_group
  end
end
