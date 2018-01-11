class CreateManagerHistories < ActiveRecord::Migration
  def change
    create_table :manager_histories do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :manager
      t.references :manager_2
      t.date :effective_from
      t.date :effective_to

      t.timestamps null: false
    end
  end
end
