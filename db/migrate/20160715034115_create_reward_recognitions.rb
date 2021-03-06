class CreateRewardRecognitions < ActiveRecord::Migration
  def change
    create_table :reward_recognitions do |t|
      t.references :reward_type, index: true, foreign_key: true
      t.references :reward_owner, index: true, foreign_key: true
      t.string :cost_unit
      t.string :communication
      t.string :r_type

      t.timestamps null: false
    end
  end
end
