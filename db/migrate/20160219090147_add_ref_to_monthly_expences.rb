class AddRefToMonthlyExpences < ActiveRecord::Migration
  def change
    add_reference :monthly_expences, :expencess_type, index: true, foreign_key: true
  end
end
