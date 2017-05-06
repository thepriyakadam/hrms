class AddNewsColToWorkingdays < ActiveRecord::Migration
  def change
    add_column :workingdays, :date, :date
  end
end
