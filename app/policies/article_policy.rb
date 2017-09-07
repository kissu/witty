class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.role >= "investisseur" # investissor and superior can create an article
  end


end
