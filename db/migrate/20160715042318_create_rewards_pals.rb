class CreateRewardsPals < ActiveRecord::Migration
  def change
    create_table :rewards_pals do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :date
      t.text :purpose
      t.references :reward_type, index: true, foreign_key: true
      t.string :qty
      t.references :reporting_master

      t.timestamps null: false
    end
  end
end
