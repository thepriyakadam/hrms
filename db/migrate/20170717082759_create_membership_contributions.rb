class CreateMembershipContributions < ActiveRecord::Migration
  def change
    create_table :membership_contributions do |t|
      t.references :membership, index: true, foreign_key: true
      t.date :date
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
