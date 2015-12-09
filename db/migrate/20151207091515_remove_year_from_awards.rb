class RemoveYearFromAwards < ActiveRecord::Migration
  def change
    remove_column :awards, :year, :integer
  end
end
