class ChangeColumnNameTransactionRecords < ActiveRecord::Migration
  def change
  	rename_column :transaction_records, :type, :transaction_type
  end
end
