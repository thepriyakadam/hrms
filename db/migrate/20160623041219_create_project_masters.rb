class CreateProjectMasters < ActiveRecord::Migration
  def change
    create_table :project_masters do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
