class StudioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def index?
    user.is_admin
  end

    def show?
      user.is_admin
    end

    def new?
      user.is_admin
    end

    def create?
      new?
    end

    def edit?
      user.is_admin
    end

    def update?
      edit?
    end

    def destroy?
      user.is_admin
    end

end
