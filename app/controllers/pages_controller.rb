class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:send_report, :onboarding, :ask_intro]

  def ask_intro
    @contact = Contact.find(params[:id])
  end

  def onboarding_change
    File.open("app/views/pages/_onboarding_text.html.erb", "w+") { |file|
      file.write(params[:onboarding_page])
    }
    flash[:notice] = "Successfully modified..."
    redirect_to onboarding_path
  end

  private

  def onboarding_params
    params.permit(:onboarding_page)
  end
end
