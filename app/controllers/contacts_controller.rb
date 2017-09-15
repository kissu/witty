class ContactsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contacts = policy_scope(Contact)
  end

  def new
    @contact = Contact.new
    authorize @contact
  end
end
