class DropProductsTable < ActiveRecord::Migration
  def up
    drop_table :policy_details
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
