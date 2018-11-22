class CreateLatemarkMasters < ActiveRecord::Migration
  def change
    create_table :latemark_masters do |t|
      t.time :company_time
      t.string :allow_latemark
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
