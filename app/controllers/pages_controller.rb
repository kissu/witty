class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:send_report, :onboarding, :ask_intro]

  def ask_intro
    @contact = Contact.find(params[:id])
  end
end
