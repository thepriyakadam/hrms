class CreateCostCenters < ActiveRecord::Migration
  def change
    create_table :cost_centers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
