class CreateAppraisers < ActiveRecord::Migration
  def change
    create_table :appraisers do |t|

      t.timestamps null: false
    end
  end
end
