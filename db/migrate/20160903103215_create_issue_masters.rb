class CreateIssueMasters < ActiveRecord::Migration
  def change
    create_table :issue_masters do |t|
      t.references :issue_tracker_group, index: true, foreign_key: true
      t.references :issue_type, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
