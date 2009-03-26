# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cios_session',
  :secret      => 'f3577ff953e55bd46ba49527350f92506d40d7826a23e56dbaa5952d50c622c1e8c24b32b2922c2b6f504fbb0c53bfba9a68da191a5d2a1f7aca198f65d120f1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
