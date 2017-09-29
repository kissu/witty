class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:send_report, :onboarding]

end
