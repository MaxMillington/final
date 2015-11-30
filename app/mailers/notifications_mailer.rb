class NotificationsMailer < ApplicationMailer
  def contact(email_info)
    @message = email_info[:message]
    mail(
        to: email_info[:email],
        subject: "Check this link."
    )
  end
end