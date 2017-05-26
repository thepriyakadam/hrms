class CreateSocietyMemberShips < ActiveRecord::Migration
  def change
    create_table :society_member_ships do |t|
      t.boolean :is_society_member
      t.decimal :amount, precision: 15, scale: 2, default: 0
      t.references :employee, index: true, foreign_key: true
      t.date :start_date
      t.timestamps null: false
    end
  end
end
