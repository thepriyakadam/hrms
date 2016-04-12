class AddColToAttributeRatingSheets < ActiveRecord::Migration
  def change
    add_column :attribute_rating_sheets, :is_confirm_appraiser, :boolean
  end
end
