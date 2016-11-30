class AddColToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :status, :boolean
  end
end
