require 'optimizely'
require 'httparty'
require 'twilio-ruby'

# Enter your own FS project ID
FULLSTACK_PROJECT_ID = '10335804738'
TWILIO_ACCOUNT_SID = 'ASK ANDREAS'
TWILIO_AUTH_TOKEN = 'ASK ANDREAS'
TWILIO_NUMBER = '+14157022765'

# Setup Optimizely
uri = URI("https://optimizely.s3.amazonaws.com/json/#{FULLSTACK_PROJECT_ID}.json")
datafile = HTTParty.get(uri).body
optimizely_client = Optimizely::Project.new(datafile, Optimizely::EventDispatcher.new, Optimizely::SimpleLogger.new)

# Setup Twilio
twilio_client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN

# Enter the numbers here that you want to send a text message to
numbers = ['+16178754788']

# Iterate through numbers and send text according to experiment
for user in numbers
  enabled = optimizely_client.is_feature_enabled('sms_alert', user)
  sms_body = optimizely_client.get_feature_variable_string('sms_alert', 'sms_body', user)
  p enabled
  p sms_body
  if enabled
    twilio_client.api.account.messages.create(
      from: TWILIO_NUMBER,
      to: user,
      body: sms_body
    )   
  end
end
