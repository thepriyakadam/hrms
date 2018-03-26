class CreateGratuities < ActiveRecord::Migration
  def change
    create_table :gratuities do |t|
      t.references :employee, index: true, foreign_key: true
    	t.references :gratuity_master, index: true, foreign_key: true
    	t.decimal :gratuity_amount
      t.string :no_of_year
      t.decimal :total_gratuity
      t.date :day
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
