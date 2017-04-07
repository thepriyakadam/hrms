class CreateAuthorizedBies < ActiveRecord::Migration
  def change
    create_table :authorized_bies do |t|

      t.timestamps null: false
    end
  end
end
