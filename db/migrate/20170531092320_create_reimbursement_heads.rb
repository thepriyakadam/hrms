class CreateReimbursementHeads < ActiveRecord::Migration
  def change
    create_table :reimbursement_heads do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
