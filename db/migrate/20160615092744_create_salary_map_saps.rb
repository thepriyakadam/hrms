class CreateSalaryMapSaps < ActiveRecord::Migration
  def change
    create_table :salary_map_saps do |t|
      t.references :salary_component, index: true, foreign_key: true
      t.string :account_code
      t.boolean :is_debit

      t.timestamps null: false
    end
  end
end
