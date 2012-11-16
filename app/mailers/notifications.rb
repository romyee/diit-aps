class Notifications < ActionMailer::Base
  default from: "apsystem.diit@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.signup.subject
  #
  def signup(user)
    @user = user
    mail to: @user.email, subject: "Account created successfully"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.application_submitted.subject
  #
  def application_submitted(application)
    @application = application
    mail to: @application.user.email, subject: "Application Received"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.application_received.subject
  #
  def application_received(application)
    @application = application
    mail to: "abunashir@diit.info", subject: "New Application Request"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.application_forwarded.subject
  #
  def application_forwarded(application_process)
    @process = application_process
    mail to: @process.reffer_to.email, subject: "Received a forwarded application for processing"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.approved.subject
  #
  def approved(process)
    @process = process
    @application = @process.application_form
    mail to: @application.user.email, subject: "#{@application.form.title} Application Accepted"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.rejected.subject
  #
  def rejected(process)
    @process = process
    @application = @process.application_form
    mail to: @application.user.email, subject: "#{@application.form.title} Application Rejected"
  end
end
