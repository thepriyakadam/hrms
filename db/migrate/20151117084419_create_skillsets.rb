class CreateSkillsets < ActiveRecord::Migration
  def change
    create_table :skillsets do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :name
      t.string :skill_level
      t.string :description
      

      t.timestamps null: false
    end
  end
end
