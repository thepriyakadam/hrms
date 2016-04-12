class AddRefToEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :religion, :string
    add_reference :employees, :religion, index: true, foreign_key: true
    remove_column :families, :religion, :string
    add_reference :families, :religion, index: true, foreign_key: true
  end
end
