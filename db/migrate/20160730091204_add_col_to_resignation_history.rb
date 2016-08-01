class AddColToResignationHistory < ActiveRecord::Migration
  def change
    add_column :resignation_histories, :resign_status, :string
  end
end
