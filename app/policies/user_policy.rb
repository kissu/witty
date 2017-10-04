class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(invitation_accepted_at: nil)
    end
  end

  def send_reporting?
    user.entrepreneur?
  end

  def send_invitation?
    user.super_admin?
  end

  def link_onboarding?
    user.entrepreneur? or user.super_admin?
  end

  def link_sign_out?
    user.entrepreneur? or user.super_admin?
  end

  def link_admin?
    user.super_admin?
  end

  def choose_action_of_button?
    true
  end
end
