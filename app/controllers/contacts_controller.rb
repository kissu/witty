class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:edit, :update, :destroy]

  def index
    @contacts = policy_scope(Contact)
  end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def edit
  end

  def update
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    if @contact.save
      flash[:notice] = "Votre contact a bien été ajouté"
      redirect_to contacts_path
    else
      render :new
    end
  end

  def destroy
    @contact.destroy
    flash[:notice] = "Votre contact a bien été supprimé"
    redirect_to contacts_path
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
    authorize @contact
  end

  def contact_params
    params.require(:contact).permit(:title, :description, tag_ids: [])
  end
end
