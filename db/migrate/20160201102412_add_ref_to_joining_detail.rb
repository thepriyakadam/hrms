class AddRefToJoiningDetail < ActiveRecord::Migration
  def change
    add_reference :joining_details, :payment_mode, index: true, foreign_key: true
    remove_column :joining_details, :payment_mode, :string
  end
end
