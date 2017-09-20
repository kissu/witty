class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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

  def ask_intro?
    user.entrepreneur? or user.expert?
  end
end
