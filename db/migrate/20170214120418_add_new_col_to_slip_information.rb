class AddNewColToSlipInformation < ActiveRecord::Migration
  def change
    add_column :slip_informations, :account_no, :string
  end
end
