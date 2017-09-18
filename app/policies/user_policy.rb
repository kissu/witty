class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(invitation_accepted_at: nil)
    end
  end

  def send_reporting?
    true
  end

  def ask_for_contact?
    true
  end
end
