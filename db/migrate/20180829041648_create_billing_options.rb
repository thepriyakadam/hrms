class CreateBillingOptions < ActiveRecord::Migration
  def change
    create_table :billing_options do |t|
      t.references :expence_opestion, index: true, foreign_key: true
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
