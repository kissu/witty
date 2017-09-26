class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.includes(:upvotes).where(featured_at: nil).order('upvotes_count DESC')
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

  def share?
    user.entrepreneur? or user.expert?
  end

  def featured?
    user.super_admin?
  end
end
