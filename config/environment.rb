# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# this was causing emails to end up as spam and up in junk when sent out i created a temp teamcare gmail account for now in application.rb
# ActionMailer::Base.smtp_settings = {
#    :user_name => 'apikey',
#    :password => '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',
#    :domain => 'sendgrid.com',
#    :address => 'smtp.sendgrid.net',
#    :port => 587,
#    :authentication => :plain,
#    :enable_starttls_auto => true
# }