class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    Devise::Mailer.invitation_instructions.deliver_now
  end
end
