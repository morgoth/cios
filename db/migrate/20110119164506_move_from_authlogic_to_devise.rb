class MoveFromAuthlogicToDevise < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.rename :crypted_password, :encrypted_password
      t.rename :login_count, :sign_in_count
      t.rename :last_login_at, :last_sign_in_at
      t.rename :current_login_at, :current_sign_in_at
      t.rename :current_login_ip, :current_sign_in_ip
      t.rename :last_login_ip, :last_sign_in_ip

      t.remove :last_request_at, :persistence_token, :perishable_token, :single_access_token, :failed_login_count

      t.string :reset_password_token, :remember_token, :email
      t.datetime :remember_created_at
    end

  end

  def self.down
     change_table :users do |t|
      t.rename :encrypted_password, :crypted_password
      t.rename :sign_in_count, :login_count
      t.rename :last_sign_in_at, :last_login_at
      t.rename :current_sign_in_at, :current_login_at
      t.rename :current_sign_in_ip, :current_login_ip
      t.rename :last_sign_in_ip, :last_login_ip

      t.datetime :last_request_at
      t.string :persistence_token, :single_access_token

      t.remove :reset_password_token, :remember_token, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :email
    end
  end
end
