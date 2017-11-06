class CreatePolicyTypes < ActiveRecord::Migration
  def change
    create_table :policy_types do |t|
      t.string :code
      t.string :name
      t.string :description
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
