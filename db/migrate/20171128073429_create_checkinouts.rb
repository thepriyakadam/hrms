class CreateCheckinouts < ActiveRecord::Migration
  ActiveRecord::Base.establish_connection("development_sec")
  def change
    create_table :checkinouts do |t|

      t.timestamps null: false
    end
  end
  ActiveRecord::Base.establish_connection(Rails.env)
end