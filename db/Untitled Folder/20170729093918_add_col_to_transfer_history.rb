class AddColToTransferHistory < ActiveRecord::Migration
  def change
    add_column :transfer_histories, :effective_from, :date
    add_column :transfer_histories, :effective_to, :date
  end
end
