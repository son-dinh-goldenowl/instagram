# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string    :fullname,                 null: false, default: ''
      t.string    :user_name,                null: false, default: ''
      t.string    :email,                    null: false, default: ''
      t.string    :avatar
      t.datetime  :birthday
      t.string    :telephone,                null: false, default: ''
      t.string    :gender,                   null: false, default: ''
      t.string    :encrypted_password,       null: false, default: ''
      t.datetime  :remember_created_at
      t.datetime  :current_sign_in_at
      t.datetime  :last_sign_in_at
      t.string    :confirmation_token
      t.datetime  :confirmed_at
      t.datetime  :confirmation_sent_at
      t.string    :unconfirmed_email
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps                          null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :reset_password_token,   unique: true
  end
end
