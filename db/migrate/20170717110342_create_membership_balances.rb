class CreateMembershipBalances < ActiveRecord::Migration
  def change
    create_table :membership_balances do |t|
      t.references :membership, index: true, foreign_key: true
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
