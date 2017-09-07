class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    is_investor_or_superior?
  end

  def update?
    is_investor_or_superior?
  end

  def destroy?
    is_investor_or_superior?
  end

  private

  def is_investor_or_superior?
    user.role >= "investisseur" # investor and superior
  end
end
