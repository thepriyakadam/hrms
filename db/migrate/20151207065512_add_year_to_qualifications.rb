class AddYearToQualifications < ActiveRecord::Migration
  def change
    add_reference :qualifications, :year, index: true, foreign_key: true
  end
end
