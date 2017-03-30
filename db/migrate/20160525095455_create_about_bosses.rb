class CreateAboutBosses < ActiveRecord::Migration
  def change
    create_table :about_bosses do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
