class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :network]

  def home
  end
end
