class CreateCurrencyMasters < ActiveRecord::Migration
  def change
    create_table :currency_masters do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
