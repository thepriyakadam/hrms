class AddColToTransactionRecords < ActiveRecord::Migration
  def change
    add_column :transaction_records, :email_msg, :text
  end
end
