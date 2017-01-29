class CreateCompanyPolicies < ActiveRecord::Migration
  def change
    create_table :company_policies do |t|
      t.string :name
      t.date :effective_from
      t.date :effective_to
      t.boolean :status
      t.string :document

      t.timestamps null: false
    end
  end
end
