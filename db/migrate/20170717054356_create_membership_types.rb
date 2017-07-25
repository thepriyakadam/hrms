class CreateMembershipTypes < ActiveRecord::Migration
  def change
    create_table :membership_types do |t|
      t.string :code
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
