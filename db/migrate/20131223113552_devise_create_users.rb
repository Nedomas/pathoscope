class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
    ***REMOVED***# Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

    ***REMOVED***# Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

    ***REMOVED***# Rememberable
      t.datetime :remember_created_at

    ***REMOVED***# Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

    ***REMOVED***# Confirmable
    ***REMOVED*** t.string   :confirmation_token
    ***REMOVED*** t.datetime :confirmed_at
    ***REMOVED*** t.datetime :confirmation_sent_at
    ***REMOVED*** t.string   :unconfirmed_email # Only if using reconfirmable

    ***REMOVED***# Lockable
    ***REMOVED*** t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
    ***REMOVED*** t.string   :unlock_token # Only if unlock strategy is :email or :both
    ***REMOVED*** t.datetime :locked_at

      t.string :username

      t.timestamps
***REMOVED***

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  ***REMOVED*** add_index :users, :confirmation_token,   :unique => true
  ***REMOVED*** add_index :users, :unlock_token,         :unique => true
***REMOVED***
***REMOVED***
