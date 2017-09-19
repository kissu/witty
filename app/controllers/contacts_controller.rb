class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = Contact.all
    @contacts = policy_scope(Contact)
  end
end
