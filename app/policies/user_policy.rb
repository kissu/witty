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
end
