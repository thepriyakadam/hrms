class CreateRecognitionTypes < ActiveRecord::Migration
  def change
    create_table :recognition_types do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
