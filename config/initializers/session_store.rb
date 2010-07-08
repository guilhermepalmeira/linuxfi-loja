# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_loja_session',
  :secret      => 'e14a82959c89d8709e4d30482fff53167c06a806a97a8918266ee310ae88e8539b1daf36ee6c4e524f1047b13a579ecdff84a54b961479a227075b988c3d038f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
