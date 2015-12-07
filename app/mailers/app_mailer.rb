class AppMailer < ActionMailer::Base
  def notify_on_new_application(application)
    @new_application = application
    mail from: 'no-reply@eastgate.io', to: application.email, subject: 'Your application to East Gate has been submitted.'
  end
end