class AddColumnToAccidentRecords < ActiveRecord::Migration
  def change
    add_reference :accident_records, :root_cause_master, index: true, foreign_key: true
    add_reference :accident_records, :department, index: true, foreign_key: true
    add_attachment :accident_records, :avatar
  end
end
