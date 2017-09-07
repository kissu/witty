class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    is_entrepreneur?
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

  def is_entrepreneur?
    user.role >= "entrepreneur" #
  end
end
