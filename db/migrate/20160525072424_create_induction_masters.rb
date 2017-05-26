class CreateInductionMasters < ActiveRecord::Migration
  def change
    create_table :induction_masters do |t|
      t.integer :code
      t.text :description
      t.string :code

      t.timestamps null: false
    end
  end
end
