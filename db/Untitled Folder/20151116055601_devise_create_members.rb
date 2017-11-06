class DeviseCreateMembers < ActiveRecord::Migration
  def change
    create_table(:members) do |t|
      ## Database authenticatable
      t.string :manual_member_code
      t.references :role, index: true, foreign_key: true
      t.string :member_code
      t.string :subdomain
      t.string :email,              null: true, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :email, null: true
      t.boolean :is_gps, :boolean
      t.float :latitude, :float
      t.float :longitude, :float
      t.string :location, :string

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.timestamps null: false

      # t.references :account, polymorphic: true, index: true
      # t.references :company, index: true, foreign_key: true
      # t.references :company_location, index: true, foreign_key: true
      # t.references :department, index: true, foreign_key: true
      # t.references :employee, index: true, foreign_key: true
    end

    add_index :members, :email,                unique: true
    add_index :members, :reset_password_token, unique: true
    add_index :members, :member_code,          unique: true
    # add_index :members, :confirmation_token,   unique: true
    # add_index :members, :unlock_token,         unique: true
  end
end
