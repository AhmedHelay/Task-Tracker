class ApplicationMailer < ActionMailer::Base
  default from: 'tasktracker@mail.org'
  layout 'mailer'
end
