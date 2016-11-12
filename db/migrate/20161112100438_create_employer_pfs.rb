class CreateEmployerPfs < ActiveRecord::Migration
  def change
    create_table :employer_pfs do |t|
      t.string :base_component
      t.decimal :percentage
      t.date :effective_from
      t.date :effective_to
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
