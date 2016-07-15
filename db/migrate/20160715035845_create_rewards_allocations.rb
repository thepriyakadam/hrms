class CreateRewardsAllocations < ActiveRecord::Migration
  def change
    create_table :rewards_allocations do |t|
      t.references :reward_type, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.date :from
      t.date :to
      t.string :allocated_qty
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
