#  Optimizely Full Stack + Twilio - Ruby SMS tests 
---

Script to send a simple sms message to an array of phone numbers. The body of the sms can be modified and tested via Optimizely Full Stack using feature variables (beta)

## How to use
---
*Requirements*
Ruby 1.8 or later with RubyGems installed


*Setup*
1. In a new terminal window, run ```git clone git@github.com:andreas-optimizely/ruby-sms-script.git```
2. ```cd ruby-sms-script```
3. ```bundle install```
4. Create an Optimizely Full Stack project
5. In line 6 of sms.rb enter your project ID
6. Create a Twilio account and add your SID and Auth token to lines 7 and 8 respectively
7. Enter the phone numbers you wish to send an SMS to in the array in line 20
8. Create an Optimizely Feature flag with the name "sms_alert" with a variable named "body" (type = string)
9. Either create an experiment or rollout using the sms_alert feature
10. Run the script! ```ruby sms.rb```