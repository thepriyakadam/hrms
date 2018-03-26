class CreatePromotionHistories < ActiveRecord::Migration
  def change
    create_table :promotion_histories do |t|
      t.references :employee_promotion, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.references :employee_grade, index: true, foreign_key: true
      t.references :employee_category, index: true, foreign_key: true
      t.string :employee_ctc
      t.text :justification
      t.date :effective_from
      t.date :effective_to

      t.timestamps null: false
    end
  end
end
