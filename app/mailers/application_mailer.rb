class ApplicationMailer < ActionMailer::Base
  default from: "steve@steve.com"
  layout 'mailer'
end