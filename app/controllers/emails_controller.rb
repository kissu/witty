class EmailsController < ApplicationController

  def send_reporting
    user = current_user
    authorize user

    UserMailer.reporting(user, email_params).deliver_now
    flash[:notice] = "Votre rapport a été envoyé"
    redirect_to root_path

  end

  def ask_intro
    user = current_user
    contact = Contact.find(params[:id])
    authorize contact
    UserMailer.contact(user, contact, email_params).deliver_now
    flash[:notice] = "Votre demande d'introduction a été envoyée"
    redirect_to contacts_path
  end

  private

  def email_params
    params.permit(:id, :message, :file)
  end
end
