class CreateRecruiters < ActiveRecord::Migration
  def change
    create_table :recruiters do |t|
      t.references :employee, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
