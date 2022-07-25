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

  def question(users,questions)
    @user = users
    @questions = questions
    mail(to: @user.email, subject: 'New question added to your followed topic')
  end
end