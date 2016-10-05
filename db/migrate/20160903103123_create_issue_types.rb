class CreateIssueTypes < ActiveRecord::Migration
  def change
    create_table :issue_types do |t|
      t.string :name
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
