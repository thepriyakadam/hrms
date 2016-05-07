class CreateAssetTypes < ActiveRecord::Migration
  def change
    create_table :asset_types do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
