class NotificationMailer < ApplicationMailer

  def notification_mailer(notification)
    @notification = notification
    @url = "http://postbox.tut/"
    mail(:subject => "New Notification")
  end

  def uploaded(current_user)
    @user = current_user
    mail(to: @user.email, subject: 'File uploaded')
  end

  def question(emails)
    mail(to: emails, subject: 'New question added ')
  end
end
