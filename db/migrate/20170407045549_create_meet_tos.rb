class CreateMeetTos < ActiveRecord::Migration
  def change
    create_table :meet_tos do |t|

      t.timestamps null: false
    end
  end
end
