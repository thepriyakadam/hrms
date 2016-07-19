class CreatePerformanceActivities < ActiveRecord::Migration
  def change
    create_table :performance_activities do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
