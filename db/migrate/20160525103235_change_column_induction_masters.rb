class ChangeColumnInductionMasters < ActiveRecord::Migration
  def change  
   change_column :induction_masters, :code, :string
  end
end
