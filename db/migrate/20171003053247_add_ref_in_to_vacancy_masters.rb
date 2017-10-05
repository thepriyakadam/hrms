class AddRefInToVacancyMasters < ActiveRecord::Migration
  def change
    add_reference :vacancy_masters, :replacement
  end
end
