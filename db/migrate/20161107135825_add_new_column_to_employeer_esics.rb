class AddNewColumnToEmployeerEsics < ActiveRecord::Migration
  def change
    add_column :employeer_esics, :actual_amount, :decimal
  end
end
