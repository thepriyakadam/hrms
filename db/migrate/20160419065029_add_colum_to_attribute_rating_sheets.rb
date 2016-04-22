class AddColumToAttributeRatingSheets < ActiveRecord::Migration
  def change
    add_column :attribute_rating_sheets, :appraiser2_comment, :text
    add_column :attribute_rating_sheets, :appraiser2_rating, :integer
    add_column :attribute_rating_sheets, :final_comment, :text
    add_column :attribute_rating_sheets, :final_rating, :integer
  end
end
