class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :name
      t.date :from
      t.date :to
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
