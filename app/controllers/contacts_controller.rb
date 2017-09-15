class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @contacts = policy_scope(Contact)
  end
end
