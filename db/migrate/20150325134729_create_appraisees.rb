class CreateAppraisees < ActiveRecord::Migration
  def change
    create_table :appraisees do |t|

      t.timestamps null: false
    end
  end
end
