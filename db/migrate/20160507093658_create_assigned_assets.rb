class CreateAssignedAssets < ActiveRecord::Migration
  def change
    create_table :assigned_assets do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :asset_type, index: true, foreign_key: true
      t.string :assets_detail
      t.string :assets_id
      t.decimal :assets_value
      t.string :assest_status
      t.date :issue_date
      t.date :valid_till
      t.date :returned_on
      t.text :remarks

      t.timestamps null: false
    end
  end
end
