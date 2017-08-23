class AddColumnToTransferHistory < ActiveRecord::Migration
  def change
    remove_reference :transfer_histories, :reporting_master, index: true, foreign_key: true
    add_reference :transfer_histories, :reporting_master
  end
end
