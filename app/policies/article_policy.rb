class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    user.investisseur? or user.super_admin?
  end

  def destroy?
    user.investisseur? or user.super_admin?
  end
end
