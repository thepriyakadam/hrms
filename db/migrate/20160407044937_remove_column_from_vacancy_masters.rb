class RemoveColumnFromVacancyMasters < ActiveRecord::Migration
  def change
    remove_column :vacancy_masters, :educational_qualification, :string
    add_reference :vacancy_masters, :degree, index: true, foreign_key: true
  end
end
