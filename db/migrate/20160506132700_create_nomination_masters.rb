class CreateNominationMasters < ActiveRecord::Migration
  def change
    create_table :nomination_masters do |t|
      t.string :code
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
