class CreateExcelUploads < ActiveRecord::Migration
  def change
    create_table :excel_uploads do |t|
      t.string :code
      t.string :file_name
      t.string :size

      t.timestamps null: false
    end
  end
end
