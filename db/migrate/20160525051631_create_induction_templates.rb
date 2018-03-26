class CreateInductionTemplates < ActiveRecord::Migration
  def change
    create_table :induction_templates do |t|
      t.string :template_no
      t.text :description
      t.text :activity
      t.integer :day
      t.integer :duration
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
