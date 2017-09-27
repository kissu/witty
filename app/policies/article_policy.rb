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
    user.super_admin?
  end

  def destroy?
    user.super_admin?
  end

  def share?
    user.entrepreneur?
  end

  def featured?
    user.super_admin?
  end
end
