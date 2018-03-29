class AddColToVacancyMaster < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :notice_period_day, :string
  end
end
