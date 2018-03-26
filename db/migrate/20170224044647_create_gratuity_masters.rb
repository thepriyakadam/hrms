class CreateGratuityMasters < ActiveRecord::Migration
  def change
    create_table :gratuity_masters do |t|
      t.string :no_of_year
      t.string :base_component
      t.integer :day_in_month
      t.string :payable_day
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
