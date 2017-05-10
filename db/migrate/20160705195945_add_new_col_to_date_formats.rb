class AddNewColToDateFormats < ActiveRecord::Migration
  def change
    add_column :date_formats, :is_active, :boolean
  end
end
