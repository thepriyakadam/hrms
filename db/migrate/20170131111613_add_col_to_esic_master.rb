class AddColToEsicMaster < ActiveRecord::Migration
  def change
    add_column :esic_masters, :to_date, :date
  end
end
