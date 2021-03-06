# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Corruptos::Application.initialize!

require 'tlsmail'
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,  
  :address            => 'smtp.gmail.com',
  :port               => 587,
  :tls                => true,
  :domain             => 'gmail.com',
  :authentication     => :plain,
  :user_name          => 'senha.corruptos@gmail.com',
  :password           => 'mypassiscorruptos'
}