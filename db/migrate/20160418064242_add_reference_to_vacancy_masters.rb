class AddReferenceToVacancyMasters < ActiveRecord::Migration
  def change
  	add_reference :vacancy_masters, :degree_1, index: true, foreign_key: true
  	add_reference :vacancy_masters, :degree_2, index: true, foreign_key: true
  end
  end
