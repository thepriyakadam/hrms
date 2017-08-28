class CreateResourcePoolMasters < ActiveRecord::Migration
  def change
    create_table :resource_pool_masters do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
