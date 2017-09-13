class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(invitation_accepted_at: !nil)
    end
  end
end
