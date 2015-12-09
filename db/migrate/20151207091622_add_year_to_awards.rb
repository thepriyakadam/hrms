class AddYearToAwards < ActiveRecord::Migration
  def change
    add_reference :awards, :year, index: true, foreign_key: true
  end
end
