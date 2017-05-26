class CreateTravelExpenceTypes < ActiveRecord::Migration
  def change
    create_table :travel_expence_types do |t|
      t.string :code
      t.string :name
      t.string :description
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
