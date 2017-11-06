class CreateEmailConfigs < ActiveRecord::Migration
  def change
    create_table :email_configs do |t|
      t.string :url_host
      t.integer :url_port
      t.string :delivery_method
      t.string :address
      t.integer :port
      t.string :username
      t.string :pwd
      t.string :authentication

      t.timestamps null: false
    end
  end
end
