class EmailsController < ApplicationController

  def send_reporting
    user = current_user
    authorize user

    # variable = Mailjet::Send.create(messages: [{
    #     'From'=> {
    #         'Email'=> 'florent.merian@aquiti.fr',
    #         'Name'=> 'Mailjet Pilot'
    #     },
    #     'To'=> [
    #         {
    #             'Email'=> 'mathieu.lague@previsionweb.com',
    #             'Name'=> 'passenger 1'
    #         }
    #     ],
    #     'Subject'=> 'Your email flight plan!',
    #     'TextPart'=> 'Dear passenger 1, welcome to Mailjet! May the delivery force be with you!',
    #     'HTMLPart'=> '<h3>Dear passenger 1, welcome to Mailjet!</h3><br />May the delivery force be with you!'
    # }]
    # )
    # p variable.attributes['Messages']

    UserMailer.reporting(user, email_params).deliver_now
    flash[:notice] = "Votre reporting a bien été envoyé"
    redirect_to root_path

  end

  def ask_for_contact(contact)
    authorize contact
    UserMailer.contact
   # authorize
  end

  private

  def email_params
    params.permit(:ca, :depenses, :nb_client)
  end
end
