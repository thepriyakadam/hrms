class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.string :code
      t.string :description
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
