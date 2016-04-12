class CreateCompanyShifts < ActiveRecord::Migration
  def change
    create_table :company_shifts do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :in_time
      t.string :out_time

      t.timestamps null: false
    end
  end
end
