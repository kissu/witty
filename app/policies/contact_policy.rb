class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      user.super_admin?
    end

    def update?
      user.super_admin?
    end

    def destroy?
      user.super_admin?
    end
  end
end
