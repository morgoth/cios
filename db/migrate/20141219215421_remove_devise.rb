class RemoveDevise < ActiveRecord::Migration
  def up
    revert do
      add_column :users, :login, :string, null: false
      add_column :users, :encrypted_password, :string, null: false
      add_column :users, :password_salt, :string, null: false
      add_column :users, :sign_in_count, :integer, default: 0, null: false
      add_column :users, :current_sign_in_at, :datetime
      add_column :users, :last_sign_in_at, :datetime
      add_column :users, :current_sign_in_ip, :string
      add_column :users, :last_sign_in_ip, :string
      add_column :users, :reset_password_token, :string
      add_column :users, :remember_created_at, :datetime
      add_column :users, :reset_password_sent_at, :datetime
    end

    add_column :users, :password_digest, :string

    User.reset_column_information
    User.find_each { |u| u.update!(password: SecureRandom.base64)}
    change_column_null :users, :password_digest, false
  end
end
