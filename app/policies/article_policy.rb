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
    user.investisseur? or user.admin?
  end

  def destroy?
    user.investisseur? or user.admin?
  end

  private
end
