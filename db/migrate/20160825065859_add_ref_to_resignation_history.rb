class AddRefToResignationHistory < ActiveRecord::Migration
  def change
    add_reference :resignation_histories, :employee, index: true, foreign_key: true
  end
end
