class AddColmToAttributeRatingSheets < ActiveRecord::Migration
  def change
    add_column :attribute_rating_sheets, :is_confirm_appraisee, :boolean
  end
end
