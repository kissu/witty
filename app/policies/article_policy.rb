class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.entrepreneur?
  end

  def update?
    user.investisseur? or user.super_admin?
  end

  def destroy?
    user.investisseur? or user.super_admin?
  end

  private
end
