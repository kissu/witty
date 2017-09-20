class EmailsController < ApplicationController

  def send_reporting
    user = current_user
    authorize user

    UserMailer.reporting(user, email_params).deliver_now
    flash[:notice] = "Votre reporting a bien été envoyé"
    redirect_to root_path

  end

  def ask_for_contact
    user = current_user
    authorize user
    contact = Contact.find(params[:contact_id])
    UserMailer.contact(user, contact, email_params).deliver_now
    flash[:notice] = "Votre demande d'introduction a bien été envoyée"
    redirect_to network_path
  end

  private

  def email_params
    params.permit(:ca, :depenses, :treso, :nb_client, :conversion, :satisfaction,
                  :needs, :infos, :contact, :solution, :market)
  end
end
