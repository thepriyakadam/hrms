class CreateEsicEmployerMasters < ActiveRecord::Migration
  def change
    create_table :esic_employer_masters do |t|
      t.boolean :esic
      t.decimal :percentage
      t.date :effective_from
      t.date :effective_to
      t.decimal :max_limit
      t.string :base_component
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
