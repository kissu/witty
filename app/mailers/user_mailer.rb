class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Le Wagon')
  end

  def reporting(user, params)
    @user = user
    @ca = params[:ca]
    @depenses = params[:depenses]
    @nb_client = params[:nb_client]
    mail(from: @user.email, to: 'florent.merian@aquiti.fr', subject: 'Reporting')
  end

  def contact

  end
end
