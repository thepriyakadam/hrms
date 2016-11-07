class CreateEmployeerPfs < ActiveRecord::Migration
  def change
    create_table :employeer_pfs do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :pf_date
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
