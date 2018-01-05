class CreateMxAtdeventTrns < ActiveRecord::Migration
	ActiveRecord::Base.establish_connection("development_sec")
  	def change
    	create_table :mx_atdevent_trns do |t|

    	  	t.timestamps null: false
    	end
  	end
  ActiveRecord::Base.establish_connection(Rails.env)
end
