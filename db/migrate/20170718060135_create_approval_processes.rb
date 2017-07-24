class CreateApprovalProcesses < ActiveRecord::Migration
  def change
    create_table :approval_processes do |t|
      t.references :membership, index: true, foreign_key: true
      t.decimal :from,scale: 2 ,precision: 15
      t.decimal :to,scale: 2 ,precision: 15
      t.boolean :status

      t.timestamps null: false
    end
  end
end
