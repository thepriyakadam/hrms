class CreateCompanyPolicies < ActiveRecord::Migration
  def change
    create_table :company_policies do |t|
      t.string :name
      t.date :effective_from
      t.date :effective_to

      t.text :description
      t.boolean :status
      t.references :policy_type, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
