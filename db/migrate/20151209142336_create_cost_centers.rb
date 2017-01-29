class CreateCostCenters < ActiveRecord::Migration
  def change
    create_table :cost_centers do |t|
      t.string :code
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
