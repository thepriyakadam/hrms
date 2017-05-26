class AddColumnToAccidentRecords < ActiveRecord::Migration
  def change
    add_attachment :accident_records, :avatar
  end
end
