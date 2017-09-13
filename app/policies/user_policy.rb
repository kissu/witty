class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @users = []
      scope.find_each do |user|
        if user.invitation_accepted?
          @users << user
        end
      end
      @users
    end
  end
end
