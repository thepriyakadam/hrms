class AddYearToCertifications < ActiveRecord::Migration
  def change
    add_reference :certifications, :year, index: true, foreign_key: true
  end
end
