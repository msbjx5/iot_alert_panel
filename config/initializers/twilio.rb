TWILIO = YAML.load_file(Rails.root.join('config/twilio.yml'))

Twilio.configure do |config|
  config.account_sid = TWILIO['twilio_account_sid']
  config.auth_token = TWILIO['twilio_auth_token']
end
