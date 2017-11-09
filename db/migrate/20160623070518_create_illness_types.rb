class CreateIllnessTypes < ActiveRecord::Migration
  def change
    create_table :illness_types do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
