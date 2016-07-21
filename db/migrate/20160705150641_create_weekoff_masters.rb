class CreateWeekoffMasters < ActiveRecord::Migration
  def change
    create_table :weekoff_masters do |t|
      t.string :day

      t.timestamps null: false
    end
  end
end
