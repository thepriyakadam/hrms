class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :membership_type, index: true, foreign_key: true
      t.decimal :contribution
      t.date :date
      t.boolean :status

      t.timestamps null: false
    end
  end
end
