class AddNewColumnToTables < ActiveRecord::Migration
  def change
  	add_column :vacancy_masters, :vacancy_code, :string
    add_column :interview_rounds, :interview_round_confirm, :boolean
  end
end
