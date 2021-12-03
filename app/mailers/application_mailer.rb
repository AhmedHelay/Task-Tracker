class ApplicationMailer < ActionMailer::Base
  default from: 'tasktracker@mail.org'
  layout 'mailer'

  def send_msg_to_user(subject)
      mail(to: @user.email , subject: subject)
  end
end
