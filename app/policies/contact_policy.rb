class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      true
    end

    def update?
      true
    end

    def destroy?
      true
    end
  end
end
