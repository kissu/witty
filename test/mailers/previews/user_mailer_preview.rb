class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.welcome(user)
  end

  def reporting
    user = User.first
    UserMailer.reporting(user)
  end
end
