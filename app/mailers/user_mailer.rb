class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  def reporting(user, params)
    @user = user
    @message = params[:message]
    set_attachment_file(params)

    mail(
      from: 'florent.merian@aquiti.fr',
      to: 'florent.merian@aquiti.fr',
      reply_to: @user.email,
      subject: 'Reporting',
    )
  end

  def contact(user, contact, params)
    @user = user
    @contact = contact
    @message = params[:message]
    set_attachment_file(params)

    #decomment the line below to send mail with a mailjet template
    #headers['X-MJ-TemplateID'] = 222429

    mail(
      from: 'florent.merian@aquiti.fr',
      to: 'florent.merian@aquiti.fr',
      reply_to: @user.email,
      subject: 'Demande de mise en relation',
      content_type: "text/html",
    )
  end

  private

  def set_attachment_file(params)
    @file = params[:file]
    attachments[@file.original_filename] = File.read(@file.tempfile)
  end
end
