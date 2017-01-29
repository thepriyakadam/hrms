class CreateProfessionalTaxMasters < ActiveRecord::Migration
  def change
    create_table :professional_tax_masters do |t|
      t.string :base_component
      t.decimal :min_amount
      t.decimal :max_amount
      t.decimal :for_month
      t.decimal :march_amount
      t.date :effective_from
      t.date :effective_to
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
