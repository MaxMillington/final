class NotificationsMailer < ApplicationMailer
  def contact(email_info)
    @email_info = email_info
    mail(
        to: @email_info[:email],
        subject: "Check this link.",
        body: "check it: #{@email_info[:link]}"
    )
  end
end