class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  def reporting(user, params)
    @user = user
    @report = params[:report]

    mail(
      from: 'florent.merian@aquiti.fr',
      to: 'florent.merian@aquiti.fr',
      reply_to: @user.email,
      subject: 'Reporting'
    )
  end

  def contact(user, contact, params)
    @user = user
    @contact = contact
    @ca = params[:ca]
    @depenses = params[:depenses]
    @treso = params[:treso]
    @nb_client = params[:nb_client]
    @conversion = params[:conversion]
    @satisfaction = params[:satisfaction]
    @needs = params[:needs]
    @infos = params[:infos]

    mail(
      from: 'florent.merian@aquiti.fr',
      to: 'florent.merian@aquiti.fr',
      subject: 'Demande de mise en relation'
    )
  end
end
