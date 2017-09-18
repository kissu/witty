class EmailsController < ApplicationController

  def send_reporting
    user = current_user
    authorize user

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
